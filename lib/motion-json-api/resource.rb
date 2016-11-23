module MotionJsonApi
  def self.parse(json)
    Resource._object_handler(json, json.fetch("data", []), json.fetch("included", []))
  end

  class Resource
    extend Descendants

    attr_accessor :id
    attr_accessor :attributes
    attr_accessor :relationships
    attr_accessor :meta
    attr_accessor :links
    attr_accessor :top_level
    attr_accessor :included

    def initialize(object, top_level = [], included = [])
      @id = object["data"]["id"]
      @attributes = object["data"].fetch("attributes", {})
      @relationships = object["data"].fetch("relationships", {})
      @meta = object.fetch("meta", {})
      @links = object.fetch("links", {})
      @top_level = top_level
      @included = included
    end

    @_resource_type = nil
    def self.resource_type(resource_type)
      @_resource_type = resource_type
    end

    def self._resource_type
      @_resource_type
    end

    def self.attribute(attribute, options = {})
      key = options.fetch(:key, attribute)
      define_method(key) do
        self.attributes.fetch(attribute.to_s) do
          raise UndefinedAttribute, "Couldn't find attribute:`#{attribute}` in #{self.attributes}"
        end
      end
    end

    def self.has_one(relation, options = {})
      key = options.fetch(:key, relation)
      define_method(key) do
        relationship = self.relationships.fetch(relation.to_s) do
          raise UndefinedHasOneRelation, "Couldn't find relation:`#{relation}` in #{self.relationships}"
        end

        data = relationship.fetch("data")
        if data
          object = _find_in_included(data["id"], data["type"])
          payload = {"data" => object, "links" => relationship.fetch("links", {})}
          Resource._object_handler(payload, self.top_level, self.included)
        else
          nil
        end
      end
    end

    def self.has_many(relation, options = {})
      key = options.fetch(:key, relation)
      define_method(key) do
        relationship = self.relationships.fetch(relation.to_s) do
          raise UndefinedHasManyRelation, "Couldn't find relation:`#{relation}` in #{self.relationships}"
        end

        relationship.fetch("data").map do |data|
          object = _find_in_included(data["id"], data["type"])
          Resource._object_handler({"data" => object}, self.top_level, self.included)
        end
      end
    end

    private

    def _find_in_included(id, type)
      object = self.included.find { |x| x["id"] == id && x["type"] == type }
      if object.nil?
        object = self.top_level.find { |x| x["id"] == id && x["type"] == type }
      end
      object
    end

    def self._klass_for_type(type)
      resource_klass = Resource._descendants.select do |klass|
        type == klass._resource_type.to_s
      end.first

      unless resource_klass
        raise UndefinedResource, "Couldn’t find defined resource for type: #{type}"
      end

      resource_klass
    end

    def self._descendants
      Resource.descendants
    end

    def self._object_handler(object, top_level, included = nil)
      included ||= self.included || object.fetch("included", [])
      top_level ||= self.top_level || object["data"]
      top_level = [top_level].flatten

      case object["data"]
      when Array
        return object["data"].map do |data|
          resource_klass = Resource._klass_for_type(data["type"])
          resource_klass.new({"data" => data}, top_level, included)
        end
      when Hash
        resource_klass = Resource._klass_for_type(object["data"]["type"])
        resource_klass.new(object, top_level, included)
      end
    end
  end
end

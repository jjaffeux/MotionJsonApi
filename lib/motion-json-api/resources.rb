module MotionJsonApi
  class Resources
    attr_accessor :links
    attr_accessor :data

    def initialize(object, top_level, included)
      @links = object.fetch("links", {})
      @data = object["data"].map do |data|
        resource_klass = Resource._klass_for_type(data["type"])
        resource_klass.new({"data" => data}, top_level, included)
      end
    end
  end
end

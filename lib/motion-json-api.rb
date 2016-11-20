require 'motion-json-api/exceptions'
require 'motion-json-api/resource'

module MotionJsonApi
  def self.parse(json)
    Resource._object_handler(json, json.fetch("data", []), json.fetch("included", []))
  end
end

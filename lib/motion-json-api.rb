if defined?(Motion::Project::Config)
  Motion::Project::App.setup do |app|
    Dir.glob(File.join(File.dirname(__FILE__), "motion-json-api/**/*.rb")).each do |file|
      app.files.unshift(file)
    end
  end
else
  require 'motion-json-api/exceptions'
  require 'motion-json-api/descendants'
  require 'motion-json-api/resource'
end

require 'compass'

# Parse the Compass config
Compass.configuration.parse('config.rb')

# Default is 3000
configuration.preview_server_port = 3000

# Default is localhost
configuration.preview_server_host = "localhost"

# Default is true
# When false .html & index.html get stripped off generated urls
configuration.use_extensions_for_page_links = true

# Default is an empty hash
# We use Compass's config
configuration.sass_options = Compass.sass_engine_options

# Default is an empty hash
# http://haml-lang.com/docs/yardoc/file.HAML_REFERENCE.html#options
configuration.haml_options = {
  #:format => :html5,
  :attr_wrapper => '"'
}

# LOAD extra lib
lib_path = "#{Compass.configuration.project_path}src/lib/*.rb"
puts "Loading extra libs from lib path #{lib_path}"
Dir[lib_path].each do |lib|
  require lib
end
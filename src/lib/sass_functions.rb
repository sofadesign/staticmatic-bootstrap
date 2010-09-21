path =  File.join File.dirname(__FILE__),
                  "#{File.basename(__FILE__, '.rb')}",
                  "*.rb"
libs = Dir[path]
libs.each do |f| 
  require f
  mod = File.basename(f, '.rb').capitalize
  puts "Load and include Sass::Script::Functions::#{mod}"
  Sass::Script::Functions.module_eval{ include const_get(mod) }
end
module Sass::Script
  module Functions
    # substitue text in a string
    # @params 
    #   str the string to substitute text from
    #   reg the regexp given to sub
    #   rep the replacement text
    def sub(str, reg, rep = '')
      Sass::Script::String.new(str.to_s.sub(/#{reg.to_s}/, rep.to_s))
    end
    
    def timestamped_path(path, relative = true)
      assert_type path, :String
      file = full_path(path)
      public_path = relative ? path : public_path(path)
      begin
        [public_path, File.mtime(file).to_i] * "?"
      rescue
        public_path
      end
    end
    
    # Returns the width in pixels of an image 
    def width(path)
      assert_type path, :String
      Sass::Script::Number.new(img_identify(path, 'w').to_i , ["px"])
    end
    
    # Returns the height in pixels of an image
    def height(path)
      assert_type path, :String
      Sass::Script::Number.new(img_identify(path, 'h').to_i, ["px"])      
    end
    
    def public_path(path)
      File.join(Compass.configuration.http_stylesheets_path, path.to_s)
    end
    
    
    private
    
    def full_path(path)
      File.join File.expand_path(Compass.configuration.project_path), Compass.configuration.css_dir, path.to_s
    end
    
    def img_identify(path, f)
      path = full_path(path)
      `identify -format %#{f}\\\\n  #{path}`.split("\n")[0]
    end
    
    
    # def line(n)
    #   assert_type value, :Number
    #   Sass::Script::Number.new(n * .to_i, ["px"])
    # end
  end
end
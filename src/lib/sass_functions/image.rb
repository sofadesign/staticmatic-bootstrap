# Useful image functions for Sass, based on http://gist.github.com/58005
module Sass::Script::Functions
  module Image
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
  
    private
  
    def img_identify(path, f)
      path = full_path(path)
      `identify -format %#{f}\\\\n  #{path}`.split("\n")[0]
    end
  end
end
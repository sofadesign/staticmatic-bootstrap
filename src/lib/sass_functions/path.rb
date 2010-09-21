module Sass::Script::Functions
  # Utility functions for managing stylesheets assets paths
  module Path
    # Returns a timestamped path for a given relative path of a file stored in
    # the stylesheets directory. Very useful to provide long time caching
    #
    # (see http://code.google.com/intl/fr-FR/speed/page-speed/docs/caching.html#LeverageBrowserCaching)
    #
    # Example:
    #
    #     timestamped_path('css-sprite.png') # => /stylesheets/css-sprite.png?1272472033
    #
    def timestamped_path(path)
      assert_type path, :String
      path = unquote(path)
      file = full_path(path)
      begin
        Sass::Script::String.new([public_path(path).to_s, File.mtime(file).to_i] * "?")
      rescue
        public_path(path)
      end
    end
  
    # Return the full public path for a given relative path of a file stored in the stylesheets directory
    #
    # Example: for a file <tt>css-sprite.png</tt> stored in <tt>stylesheets/</tt> dir
    #    
    #      public_path('css-sprite.png') # => /stylesheets/css-sprite.png
    #
    def public_path(path)
      assert_type path, :String
      http_path = Compass.configuration.http_stylesheets_path || ''
      public_path = File.join(http_path, unquote(path).to_s)
      Sass::Script::String.new(public_path)
    end
  
    private
  
    # Returns the real path for a given relative path of a file
    def full_path(path)
      File.join File.expand_path(Compass.configuration.project_path), Compass.configuration.css_dir, path.to_s
    end
  end
end
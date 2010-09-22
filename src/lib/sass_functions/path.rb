module Sass::Script::Functions
  # Utility functions for managing stylesheets assets paths
  module Path
    # Returns a timestamped path for a given relative path of a file stored in
    # the stylesheets directory. Very useful to provide long time caching
    #
    # (see http://code.google.com/intl/fr-FR/speed/page-speed/docs/caching.html#LeverageBrowserCaching)
    #
    # Examples:
    #
    #     timestamped_path('css-sprite.png') # => css-sprite.png?1272472033
    #
    #     background: transparent url(timestamped_path("pattern.png")) repeat 
    #       # => background: transparent url(pattern.png?1272472045) repeat
    #
    def timestamped_path(path)
      assert_type path, :String
      path = unquote(path)
      file = filepath(path)
      begin
        Sass::Script::String.new([path.to_s, File.mtime(file).to_i] * "?")
      rescue
        path
      end
    end
  
    private
  
    # Returns the real path for a given relative path of a file
    def filepath(path)
      File.join File.expand_path(Compass.configuration.project_path), Compass.configuration.css_dir, path.to_s
    end
  end
end
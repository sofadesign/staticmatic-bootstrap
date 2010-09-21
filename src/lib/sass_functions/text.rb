module Sass::Script::Functions
  # Usefull functions for Sass, based on http://gist.github.com/58005
  module Text
    # substitue text in a string
    # @params 
    #   str the string to substitute text from
    #   reg the regexp given to sub
    #   rep the replacement text
    def sub(str, reg, rep = '')
      Sass::Script::String.new(str.to_s.sub(/#{reg.to_s}/, rep.to_s))
    end
  end
end
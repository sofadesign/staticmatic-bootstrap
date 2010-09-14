#
# COMPASS CONFIGURATION
#

ROOT = File.join(File.dirname(__FILE__), '/')
puts "Site root is: " + File.expand_path(ROOT)


#
# Learn more about compass configuration:
# http://compass-style.org/docs/tutorials/configuration-reference/
#

output_style = :compact           # :nested, :expanded, :compact, or :compressed
project_path = ROOT               # must be set for Compass to work 
sass_dir     = "src/stylesheets"  # dir containing Sass / Compass source files
http_path    = "/"                # root when deployed
css_dir      = "site/stylesheets" # final CSS
images_dir   = "site/images"      # final images
http_images_path = "/images"
http_stylesheets_path = "/stylesheets"

# To enable relative paths to assets via compass helper functions. Uncomment:
# relative_assets = true
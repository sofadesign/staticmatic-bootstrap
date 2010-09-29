module ApplicationHelper
  
  def page_title
    full_page_title.join(" - ")
  end
  
  def full_page_title
    page_title = [@site_name ||= "StaticMatic Bootstrap"]
    page_title << @page_title
  end
  
  def body_id
    @body_id
  end
  
  def body_class
    class_names.join(" ").strip
  end
  
  def body_class_current_page
    current_page.gsub(".html", "").split('/').reject{|p| p.to_s == ''}
  end
  
  def class_names
    body_class = body_class_current_page
    body_class << (@body_class unless @body_class.nil?)
  end

  # Creates a nav menu
  #
  # Passed items are a collection of label/url hashes like this:
  #
  #     MAIN_NAV_ITEMS = [
  #       ['Dashboard', '/dashboard'],
  #       ['Settings', '/settings'],
  #       ['Help', '/help'],
  #       ['Logout', '/logout']
  #     ]
  #
  # Output is an unordered list
  #
  #     <ul><li><a href="">...</a></li> <li><a href="">...</a></li> ...</ul>
  #
  # Each item as classes based on its label.
  # Additionaly, first item has a class 'first' and  last one has 'last'
  #
  def nav_items(items)
    lines = items.map do |item|
      label = item[0]
      url = item[1]
      classes = [urlify(label)]
      classes << 'first' if items.first == item
      classes << 'last' if items.last == item
      tag(:li, :class => classes.join(' ')) do
        if current_page =~ Regexp.new(url)
          tag(:span){ label }
        else
          link_to(label, url)
        end
      end
    end
  end
  
end
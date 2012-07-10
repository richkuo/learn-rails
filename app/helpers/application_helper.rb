module ApplicationHelper

   def full_title(page_title)
      default_title = "richkuo.com"
      if page_title.empty?
         default_title
      else
         "#{default_title} | #{page_title}"
      end
   end

end

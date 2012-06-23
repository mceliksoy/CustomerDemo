require 'will_paginate/view_helpers/action_view'

#https://github.com/mislav/will_paginate/issues/158
#https://github.com/yrgoldteeth/bootstrap-will_paginate/blob/master/config/initializers/will_paginate.rb
module WillPaginate
  module ActionView
    def will_paginate(collection = nil, options = {})
      options, collection = collection, nil if collection.is_a? Hash
      # Taken from original will_paginate code to handle if the helper is not passed a collection object.
      collection ||= infer_collection_from_controller
      options[:renderer] ||= BootstrapLinkRenderer
      options[:class] = 'pagination pagination-centered'
      options[:previous_label] = '<<'
      options[:next_label] = '>>'
      super.try :html_safe
    end

    class BootstrapLinkRenderer < LinkRenderer
      protected
      def page_number(page)
        unless page == current_page
          link(page, page, :rel => rel_value(page))
        else
          link(page, "#", :class => 'active')
        end
      end

      def gap
        text = @template.will_paginate_translate(:page_gap) { '&hellip;' }
        %(<li class="disabled"><a>#{text}</a></li>)
      end

      def previous_page
        num = @collection.current_page > 1 && @collection.current_page - 1
        previous_or_next_page(num, @options[:previous_label], @options[:previous_page_class])
      end

      def next_page
        num = @collection.current_page < @collection.total_pages && @collection.current_page + 1
        previous_or_next_page(num, @options[:next_label], @options[:next_page_class])
      end

      def previous_or_next_page(page, text, classname)
        if page
          link(text, page)
        else
          link(text, "#", :class => 'disabled')
        end
      end

      def html_container(html)
        tag(:div, tag(:ul, html), container_attributes)
      end

      private

      def link(text, target, attributes = {})
        if target.is_a? Fixnum
          attributes[:rel] = rel_value(target)
          target = url(target)
        end

        unless target == "#"
          attributes[:href] = target
        end

        classname = attributes[:class]
        attributes.delete(:classname)
        attributes.delete(:class)
        tag(:li, tag(:a, text, attributes), :class => classname)
      end

    end
  end
end


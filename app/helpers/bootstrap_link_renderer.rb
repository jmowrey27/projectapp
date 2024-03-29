class BootstrapLinkRenderer < WillPaginate::ActionView::LinkRenderer
    protected
  
    def html_container(html)
      tag :div, tag(:ul, html), container_attributes
    end
  
    def page_number(page)
      tag :li, link(page, page, rel: rel_value(page)), class: 'page-item'
    end
  
    def gap
      tag :li, link(super, '#'), class: 'disabled'
    end
  
    def previous_or_next_page(page, text, classname)
      tag :li, link(text, page || '#'), class: [classname[0..3], classname, ('disabled' unless page)].join(' ')
    end
  
    def html_attributes
      super.except('class')
    end
  end
  
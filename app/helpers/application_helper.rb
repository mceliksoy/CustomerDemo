module ApplicationHelper
  
  @@data_per_page = 3
  
  def sortable(column, title = nil)
    title ||= column.titleize
    column_css = nil
    direction = "asc"

    if column == sort_column
      direction_css = "headerSortUp"
      
      if sort_direction == "asc"
        direction_css = "headerSortDown"
        direction = "desc"
      end
      
      column_css = column == sort_column ? "header #{direction_css}" : nil      
    end

    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => column_css}
  end

#    title ||= column.titleize
#    direction_css = column == sort_column && sort_direction == "asc" ? "header headerSortDown" : "header headerSortUp"
#    column_css = column == sort_column ? "header #{direction_css}" : nil
#    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
#    link_to title, {:sort => column, :direction => direction}, {:class => column_css}

end

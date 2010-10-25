# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def parent_layout(layout)
    @content_for_layout = self.output_buffer
    self.output_buffer = render(:file => "layouts/#{layout}")
  end
  
  def define_color(index)
    index % 2 == 0 ? "#c2d7dd" : "#d8e6ea"
  end
end


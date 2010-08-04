class DashboardController < ApplicationController
  def index
    @course_classes = current_student.course_classes
    @frequencies = current_student.frequencies
  end
end


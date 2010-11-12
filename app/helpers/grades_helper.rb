module GradesHelper
  def get_course_id
    params[:course_id] ? params[:course_id] : Course.first.id
  end
  
  def get_class_id
    params[:course_class_id] ? params[:course_class_id] : CourseClass.first.id
  end
  
  def get_selected_course
    course = Course.find(get_course_id)
    [course.name, course.id]
  end
  
  def get_selected_class
    course_class = CourseClass.find(params[:course_class_id])
    [course_class.code, course_class.id]
  end
end


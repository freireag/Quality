module FrequenciesHelper
  def find_frequency(course_class, student, day)
    #student.frequencies.find_all_by_course_class_id(course_class.id)
    Frequency.of_student(student.id).at_class(course_class.id).at_day(day).first
  end
  
  def get_course_id
    params[:course_id] ? params[:course_id] : Course.first.id
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


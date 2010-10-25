module FrequenciesHelper
  def find_frequency(course_class, student, day)
    #student.frequencies.find_all_by_course_class_id(course_class.id)
    Frequency.of_student(student.id).at_class(course_class.id).at_day(day).first
  end
end


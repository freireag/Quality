class GradesController < ApplicationController
  def show
    @course_class = CourseClass.find(params[:course_class_id])
    @exams = @course_class.exams
    @students = @course_class.students
  end

  def edit
    @course_class = CourseClass.find(params[:course_class_id])
    @exams = @course_class.exams
    @students = @course_class.students
    #@exam = Exam.find(params[:exam_id])
    #@students = @exam.course_class.students
    #@exam.course_class.students.count.times {@exam.grades.build}
  end

  def update
    #@exam = Exam.find(params[:exam_id])
    @course_class = CourseClass.find(params[:course_class_id])
    @grades = params[:grades]
    @grades[:student_id].count.times do |n|
      unless @grades[:grade][n].blank?
        attributes = {:exam_id => @grades[:exam_id][n], :student_id => @grades[:student_id][n], :grade => @grades[:grade][n]}
        if @grades[:id][n].blank?
          @grade = Grade.new(attributes)
        else
          @grade = Grade.find(@grades[:id][n])
          @grade.update_attributes(attributes)
        end
        unless @grade.save
          render :action => :edit
        end
      end
    end
    redirect_to course_class_grades_path(@course_class)
  end
end


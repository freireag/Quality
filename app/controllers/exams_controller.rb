class ExamsController < ApplicationController
  before_filter :find_course_class

  def index
    @exams = @course_class.exams.find(:all, :order => "exam_order ASC")
  end

  def new
    @exam = Exam.new
  end

  def edit
    @exam = Exam.find(params[:id])
  end

  def create
    @exam = Exam.new(params[:exam])
    @exam.course_class = @course_class

    if @exam.save
      redirect_to(course_class_exams_path(@exam.course_class), :notice => 'Exam was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @exam = Exam.find(params[:id])

    if @exam.update_attributes(params[:exam])
      redirect_to(course_class_exams_path(@exam.course_class), :notice => 'Exam was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @exam = Exam.find(params[:id])
    @exam.destroy

    redirect_to(course_class_exams_url)
  end

  private
  def find_course_class
    @course_class = CourseClass.find(params[:course_class_id])
  end
end


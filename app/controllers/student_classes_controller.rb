class StudentClassesController < ApplicationController
  # GET /student_classes
  # GET /student_classes.xml
  def index
    @student = Student.find(params[:student_id])
    @student_classes = @student.student_classes

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @student_classes }
    end
  end

  # GET /student_classes/1
  # GET /student_classes/1.xml
  def show
    @student_class = StudentClass.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @student_class }
    end
  end

  # GET /student_classes/new
  # GET /student_classes/new.xml
  def new
    @student = Student.find(params[:student_id])
    @student_class = StudentClass.new
    @courses = Course.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @student_class }
    end
  end

  # GET /student_classes/1/edit
  def edit
    @student_class = StudentClass.find(params[:id])
  end

  # POST /student_classes
  # POST /student_classes.xml
  def create
    #@student_class = StudentClass.new(params[:student_class])

    @student = Student.find(params[:student_id])
    for course_class_id in params[:student_class][:course_class_id] do
      #StudentClass.create(:student_id => params[:student_id], :course_class_id => course_class_id)
      @student.course_classes << CourseClass.find(course_class_id)
    end

    redirect_to student_student_classes_path(params[:student_id])
  end

  # PUT /student_classes/1
  # PUT /student_classes/1.xml
  def update
    @student_class = StudentClass.find(params[:id])

    respond_to do |format|
      if @student_class.update_attributes(params[:student_class])
        format.html { redirect_to(@student_class, :notice => 'StudentClass was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @student_class.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /student_classes/1
  # DELETE /student_classes/1.xml
  def destroy
    @student_class = StudentClass.find(params[:id])
    @student_class.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.xml  { head :ok }
    end
  end
end


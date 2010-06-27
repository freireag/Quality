class CourseClassesController < ApplicationController
  load_and_authorize_resource

  # GET /course_classes
  # GET /course_classes.xml
  def index
    @course_classes = CourseClass.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @course_classes }
    end
  end

  # GET /course_classes/1
  # GET /course_classes/1.xml
  def show
    @course_class = CourseClass.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @course_class }
    end
  end

  # GET /course_classes/new
  # GET /course_classes/new.xml
  def new
    @course_class = CourseClass.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @course_class }
    end
  end

  # GET /course_classes/1/edit
  def edit
    @course_class = CourseClass.find(params[:id])
  end

  # POST /course_classes
  # POST /course_classes.xml
  def create
    @course_class = CourseClass.new(params[:course_class])

    respond_to do |format|
      if @course_class.save
        format.html { redirect_to(@course_class, :notice => 'CourseClass was successfully created.') }
        format.xml  { render :xml => @course_class, :status => :created, :location => @course_class }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @course_class.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /course_classes/1
  # PUT /course_classes/1.xml
  def update
    @course_class = CourseClass.find(params[:id])

    respond_to do |format|
      if @course_class.update_attributes(params[:course_class])
        format.html { redirect_to(@course_class, :notice => 'CourseClass was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @course_class.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /course_classes/1
  # DELETE /course_classes/1.xml
  def destroy
    @course_class = CourseClass.find(params[:id])
    @course_class.destroy

    respond_to do |format|
      format.html { redirect_to(course_classes_url) }
      format.xml  { head :ok }
    end
  end
end


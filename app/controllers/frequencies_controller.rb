class FrequenciesController < ApplicationController
  load_and_authorize_resource
  before_filter :find_course_class

  # GET /frequencies
  # GET /frequencies.xml
  def index
    if params[:course_class_id]
      @frequencies = @course_class.frequencies
      if params[:start_date]
        @days = fill_days(params[:start_date].to_date)
      else
        @days = frequency_days
      end
    else
      @frequencies = Frequency.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @frequencies }
    end
  end

  # GET /frequencies/1
  # GET /frequencies/1.xml
  def show
    @frequency = Frequency.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @frequency }
    end
  end

  # GET /frequencies/new
  # GET /frequencies/new.xml
  def new
    @frequency = Frequency.new
    @days = frequency_days(@course_class)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @frequency }
    end
  end

  # GET /frequencies/1/edit
  def edit
    @frequency = Frequency.find(params[:id])
  end

  # POST /frequencies
  # POST /frequencies.xml
  def create
    #@frequency = Frequency.new(params[:frequency])
    
    ids = params[:frequencies]
    ids.each do |id|
      student_id, day = id.split('#')
      frequency = find_frequency(@course_class, student_id, day)
      if frequency.nil?
        Frequency.create(:day => day, :presence => true, :student_id => student_id, :course_class_id => @course_class.id)
      end
    end
    removal_ids = params[:remove_frequencies]
    removal_ids.try(:each) do |removal_id|
      if ids.grep(removal_id).empty?
        student_id, day = removal_id.split('#')
        frequency = find_frequency(@course_class, student_id, day)
        frequency.destroy
      end
    end
    
    #render :text => "#{ids.inspect}\n#{removal_ids.inspect}"
    redirect_to course_class_frequencies_path(@course_class, :start_date => params[:start_date])
  end

  # PUT /frequencies/1
  # PUT /frequencies/1.xml
  def update
    @frequency = Frequency.find(params[:id])

    respond_to do |format|
      if @frequency.update_attributes(params[:frequency])
        format.html { redirect_to(@frequency, :notice => 'Frequency was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @frequency.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /frequencies/1
  # DELETE /frequencies/1.xml
  def destroy
    @frequency = Frequency.find(params[:id])
    @frequency.destroy

    respond_to do |format|
      format.html { redirect_to(frequencies_url) }
      format.xml  { head :ok }
    end
  end
  
  def change_week
    start_date = params[:start_date]
    direction = params[:direction]
    @days = frequency_days(start_date.to_date, direction.to_sym)
    @frequencies = @course_class.frequencies
    #render :text => params
    render :action => "index"
  end
  
  def previous_week
    start_date = params[:start_date]
    @days = frequency_days(start_date.to_date, false)
    @frequencies = @course_class.frequencies
    render :action => "index"
  end
    

  private
    def frequency_days(start_date = nil, direction = :next)
      if start_date
        if direction == :next
          first_day = start_date + 7
        elsif direction == :previous
          first_day = start_date - 7
        end
      else
        sunday = Date.today - Date.today.wday
        first_day = sunday
      end
      fill_days(first_day)
    end
    
    def fill_days(first_day)
      days = []
      first_day.upto(first_day + 6) {|day| days << day}
      days
    end
    
    def find_frequency(course_class, student_id, day)
      Frequency.of_student(student_id).at_class(course_class.id).at_day(day).first
    end
    
    def find_course_class
      @course_class = CourseClass.find(params[:course_class_id])
    end
end


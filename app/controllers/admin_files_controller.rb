class AdminFilesController < ApplicationController
  load_and_authorize_resource

  # GET /admin_files
  # GET /admin_files.xml
  def index
    @admin_files = AdminFile.accessible_by(current_ability)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @admin_files }
    end
  end

  # GET /admin_files/1
  # GET /admin_files/1.xml
  def show
    @admin_file = AdminFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @admin_file }
    end
  end

  # GET /admin_files/new
  # GET /admin_files/new.xml
  def new
    @admin_file = AdminFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @admin_file }
    end
  end

  # GET /admin_files/1/edit
  def edit
    @admin_file = AdminFile.find(params[:id])
  end

  # POST /admin_files
  # POST /admin_files.xml
  def create
    @admin_file = AdminFile.new(params[:admin_file])
    @admin_file.user = current_user

    respond_to do |format|
      if @admin_file.save
        format.html { redirect_to(@admin_file, :notice => 'AdminFile was successfully created.') }
        format.xml  { render :xml => @admin_file, :status => :created, :location => @admin_file }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @admin_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin_files/1
  # PUT /admin_files/1.xml
  def update
    @admin_file = AdminFile.find(params[:id])

    respond_to do |format|
      if @admin_file.update_attributes(params[:admin_file])
        format.html { redirect_to(@admin_file, :notice => 'AdminFile was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @admin_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_files/1
  # DELETE /admin_files/1.xml
  def destroy
    @admin_file = AdminFile.find(params[:id])
    @admin_file.destroy

    respond_to do |format|
      format.html { redirect_to(admin_files_url) }
      format.xml  { head :ok }
    end
  end
end


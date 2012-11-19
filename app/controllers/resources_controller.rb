class ResourcesController < ApplicationController

  before_filter :authenticate_user!

  def comment
    comment = Comment.build_from(Resource.find(params[:resource_id]), 
                                 current_user, 
                                 params[:comment][:body])
    comment.save
    redirect_to project_resource_path(params[:project_id], params[:resource_id])

  end

  # GET /resources
  # GET /resources.json
  def index
    @resources = Resource.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @resources }
    end
  end

  # GET /resources/1
  # GET /resources/1.json
  def show
    @project = Project.find(params[:project_id])
    @resource = Resource.find(params[:id])
    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @resource }
    end
  end

  # GET /resources/new
  # GET /resources/new.json
  def new
    @project = Project.find(params[:project_id])
    @resource = Resource.new
    @tag = String.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resource }
    end
  end

  # GET /resources/1/edit
  def edit
    @project = Project.find(params[:project_id])
    @resource = Resource.find(params[:id])
  end

  # POST /resources
  # POST /resources.json
  def create
    @project = Project.find(params[:project_id])
    @resource = @project.resources.create(params[:resource])
    
    respond_to do |format|
      if @resource.save
        format.html { redirect_to project_path(params[:project_id]) , notice: 'Resource was successfully created.' }
        format.json { render json: @resource, status: :created, location: @resource }
      else
        format.html { render action: "new" }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /resources/1
  # PUT /resources/1.json
  def update
    @resource = Resource.find(params[:id])
    @project = Project.find(params[:project_id])
    respond_to do |format|
      if @resource.update_attributes(params[:resource])
        format.html { redirect_to project_path(params[:project_id]) , notice: 'Resource was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy

    respond_to do |format|
      format.html { redirect_to project_path(params[:project_id])  }
      format.json { head :no_content }
    end
  end
end

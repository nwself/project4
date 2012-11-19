class ProjectsController < ApplicationController

  before_filter :authenticate_user!, except: :feed

  def tag
    project = Project.find(params[:id])
    project.tag_list = params[:tag]
    project.save
  end

  def comment
    comment = Comment.build_from(Project.find(params[:id]), 
                                 current_user, 
                                 params[:comment][:body])
    comment.save
    redirect_to project_path(params[:id])
  end

  def feed
    @projects = current_user.projects

    respond_to do |format|
      format.rss { render layout: false }
    end
  end

  # GET /projects
  # GET /projects.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
      format.rss { render layout: false }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
    @isAdmin = @project.user_project_rels.find_by_user_id(current_user).role== "Administrator" 
    @comment = Comment.new
    @tag = String.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end
  

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
          @rel=@project.user_project_rels.build(:project_id=>@project.id, :user_id=>current_user.id, :role=>'Administrator')
          @rel.save
        format.html { redirect_to projects_url, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to projects_url , notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }  
      format.json { head :no_content }
    end
  end
end

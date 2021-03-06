class UserProjectRelsController < ApplicationController
  
  
  # GET /to-do
  # GET /to-do.json
  def todo
    respond_to do |format|
      format.html # show.html.erb
      format.mobile # show.html.erb
      format.json { render json: @project }
    end
  end
  
  # GET /user_project_rels
  # GET /user_project_rels.json
  def index
    @user_project_rels = UserProjectRel.all

    respond_to do |format|
      format.html # index.html.erb
      format.mobile # index.html.erb
      format.json { render json: @user_project_rels }
    end
  end

  # GET /user_project_rels/1
  # GET /user_project_rels/1.json
  def show
    u = UserProjectRel.find(params[:id]).user
    
    @projects = u.projects

    #@sample = UserProjectRel.find(params[:id]).task_user_proj_rels

    respond_to do |format|
      format.html # show.html.erb
      format.mobile # show.html.erb
      format.json { render json: @user_project_rel }
    end
  end

  # GET /user_project_rels/new
  # GET /user_project_rels/new.json
  def new
    @project = Project.find(params[:project_id])
    @user_project_rel = UserProjectRel.new
    @user_list = User.where("id NOT IN (?)",@project.users.map)

    respond_to do |format|
      format.html # new.html.erb
      format.mobile # new.html.erb
      format.json { render json: @user_project_rel }
    end
  end

  # GET /user_project_rels/1/edit
  def edit
        @project = Project.find(params[:project_id])
    @user_project_rel = UserProjectRel.find(params[:id])
  end

  # POST /user_project_rels
  # POST /user_project_rels.json
  def create
    @project = Project.find(params[:project_id])
    params[:user_project_rel][:project_id]=params[:project_id]
    @user_project_rel = UserProjectRel.new(params[:user_project_rel])

    respond_to do |format|
      if @user_project_rel.save
        format.html { redirect_to @project, notice: 'User was successfully added.' }
        format.mobile { redirect_to @project, notice: 'User was successfully added.' }
        format.json { render json: @user_project_rel, status: :created, location: @user_project_rel }
      else
        format.html { render action: "new" }
        format.mobile { render action: "new" }
        format.json { render json: @user_project_rel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_project_rels/1
  # PUT /user_project_rels/1.json
  def update
        @project = Project.find(params[:project_id])
    @user_project_rel = UserProjectRel.find(params[:id])

    respond_to do |format|
      if @user_project_rel.update_attributes(params[:user_project_rel])
        format.html { redirect_to @project, notice: 'User project rel was successfully updated.' }
        format.mobile { redirect_to @project, notice: 'User project rel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.mobile { render action: "edit" }
        format.json { render json: @user_project_rel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_project_rels/1
  # DELETE /user_project_rels/1.json
  def destroy
        @project = Project.find(params[:project_id])
    @user_project_rel = UserProjectRel.find(params[:id])
    @user_project_rel.destroy

    respond_to do |format|
      format.html { redirect_to @project }
      format.mobile { redirect_to @project }
      format.json { head :no_content }
    end
  end
end

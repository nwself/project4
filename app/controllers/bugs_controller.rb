class BugsController < ApplicationController

  def tag
    bug = Bug.find(params[:bug_id])
    bug.tag_list.concat(params[:tag].split(","))
    bug.save
    redirect_to project_bug_path(params[:project_id], bug)
  end

  def comment
    comment = Comment.build_from(Bug.find(params[:bug_id]), 
                                 current_user, 
                                 params[:comment][:body])
    comment.save
    redirect_to project_bug_path(params[:project_id], params[:bug_id])

  end

  # GET /bugs
  # GET /bugs.json
  def index
    #@bugs = Bug.find_all_by_task_or_bug('B')  @bugs = Bug.all
    @project = Project.find(params[:project_id])
    @project.bugs
    @project.tasks

    respond_to do |format|
      format.html # index.html.erb
      format.mobile # index.html.erb
      format.json { render json: @bugs }
    end
  end

  # GET /bugs/1
  # GET /bugs/1.json
  def show
    @bug = Bug.find(params[:id])
    @project = Project.find(params[:project_id])
    @comment = Comment.new
    @tag = String.new
    respond_to do |format|
      format.html # show.html.erb
      format.mobile # show.html.erb
      format.json { render json: @bug }
    end
  end

  # GET /bugs/new
  # GET /bugs/new.json
  def new
    @bug = Bug.new
    @project = Project.find(params[:project_id])
    @comment = Comment.new
    respond_to do |format|
      format.html # new.html.erb
      format.mobile # new.html.erb
      format.json { render json: @bug }
    end
  end

  # GET /bugs/1/edit
  def edit
    @bug = Bug.find(params[:id])
     @project = Project.find(params[:project_id])
  end

  # POST /bugs
  # POST /bugs.json
  def create
    @rel=UserProjectRel.find_by_user_id_and_project_id(current_user.id,params[:project_id])
    @bug= @rel.bugs.create(params[:bug])
    @project = Project.find(params[:project_id])
    respond_to do |format|
      if @bug.save
        format.html { redirect_to  project_path(params[:project_id]) , notice: 'Bug was successfully created.' }
        format.mobile { redirect_to  project_path(params[:project_id]) , notice: 'Bug was successfully created.' }
        format.json { render json: @bug, status: :created, location: @bug }
      else
        format.html { render action: "new" }
        format.mobile { render action: "new" }
        format.json { render json: @bug.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bugs/1
  # PUT /bugs/1.json
  def update
    @bug = Bug.find(params[:id])
    @project = Project.find(params[:project_id])
    respond_to do |format|
      if @bug.update_attributes(params[:bug])
        format.html { redirect_to  project_path(params[:project_id]), notice: 'Bug was successfully updated.' }
        format.mobile { redirect_to  project_path(params[:project_id]), notice: 'Bug was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.mobile { render action: "edit" }
        format.json { render json: @bug.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bugs/1
  # DELETE /bugs/1.json
  def destroy
    @bug = Bug.find(params[:id])
    @bug.destroy

    respond_to do |format|
      format.html { redirect_to  project_path(params[:project_id]) }
      format.mobile { redirect_to  project_path(params[:project_id]) }
      format.json { head :no_content }
    end
  end
end

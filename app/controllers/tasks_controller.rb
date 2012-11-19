class TasksController < ApplicationController
  
  def comment
    comment = Comment.build_from(Task.find(params[:task_id]), 
                                 current_user, 
                                 params[:comment][:body])
    comment.save
    redirect_to project_task_path(params[:project_id], params[:task_id])
  end

  # GET /tasks
  # GET /tasks.json
  def index
    @project = Project.find(params[:project_id])
    @project.bugs
    @project.tasks
    
    
   # @tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])
    @project = Project.find(params[:project_id])
    @comment = Comment.new
    @tag = String.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @is_admin = UserProjectRel.find_by_user_id_and_project_id(current_user.id,params[:project_id]).role == "Administrator"
     @task = Task.new
     @project = Project.find(params[:project_id])
#     @is_admin = UserProjectRel.find_by_user_id_and_project_id(current_user.id,params[:project_id]).role == "Administrator"
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @is_admin = UserProjectRel.find_by_user_id_and_project_id(current_user.id,params[:project_id]).role == "Administrator"
    @task = Task.find(params[:id])
     @project = Project.find(params[:project_id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @is_admin = UserProjectRel.find_by_user_id_and_project_id(current_user.id,params[:project_id]).role == "Administrator"
    @rel=UserProjectRel.find_by_user_id_and_project_id(params[:task][:task_or_bug],params[:project_id])
    @task = @rel.tasks.create(params[:task])
    @project = Project.find(params[:project_id])
    
    respond_to do |format|
      if @rel.save
        format.html { redirect_to project_path(params[:project_id]), notice: 'Task was successfully created.' }
        format.json { render json: @bug, status: :created, location: @bug }
      else
        format.html { render action: "new" }
        format.json { render json: @bug.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @is_admin = UserProjectRel.find_by_user_id_and_project_id(current_user.id,params[:project_id]).role == "Administrator"
    @task = Task.find(params[:id])
    @project = Project.find(params[:project_id])
    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to project_path(params[:project_id]), notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to project_path(params[:project_id]) }
      format.json { head :no_content }
    end
  end
end

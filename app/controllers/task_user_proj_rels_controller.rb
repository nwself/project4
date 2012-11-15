class TaskUserProjRelsController < ApplicationController
  # GET /task_user_proj_rels
  # GET /task_user_proj_rels.json
  def index
    @task_user_proj_rels = TaskUserProjRel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @task_user_proj_rels }
    end
  end

  # GET /task_user_proj_rels/1
  # GET /task_user_proj_rels/1.json
  def show
    @task_user_proj_rel = TaskUserProjRel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task_user_proj_rel }
    end
  end

  # GET /task_user_proj_rels/new
  # GET /task_user_proj_rels/new.json
  def new
    @task_user_proj_rel = TaskUserProjRel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task_user_proj_rel }
    end
  end

  # GET /task_user_proj_rels/1/edit
  def edit
    @task_user_proj_rel = TaskUserProjRel.find(params[:id])
  end

  # POST /task_user_proj_rels
  # POST /task_user_proj_rels.json
  def create
    @task_user_proj_rel = TaskUserProjRel.new(params[:task_user_proj_rel])

    respond_to do |format|
      if @task_user_proj_rel.save
        format.html { redirect_to @task_user_proj_rel, notice: 'Task user proj rel was successfully created.' }
        format.json { render json: @task_user_proj_rel, status: :created, location: @task_user_proj_rel }
      else
        format.html { render action: "new" }
        format.json { render json: @task_user_proj_rel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /task_user_proj_rels/1
  # PUT /task_user_proj_rels/1.json
  def update
    @task_user_proj_rel = TaskUserProjRel.find(params[:id])

    respond_to do |format|
      if @task_user_proj_rel.update_attributes(params[:task_user_proj_rel])
        format.html { redirect_to @task_user_proj_rel, notice: 'Task user proj rel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task_user_proj_rel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_user_proj_rels/1
  # DELETE /task_user_proj_rels/1.json
  def destroy
    @task_user_proj_rel = TaskUserProjRel.find(params[:id])
    @task_user_proj_rel.destroy

    respond_to do |format|
      format.html { redirect_to task_user_proj_rels_url }
      format.json { head :no_content }
    end
  end
end

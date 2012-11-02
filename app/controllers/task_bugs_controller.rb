class TaskBugsController < ApplicationController

  before_filter :authenticate_user!

  # GET /task_bugs
  # GET /task_bugs.json
  def index
    @task_bugs = TaskBug.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @task_bugs }
    end
  end

  # GET /task_bugs/1
  # GET /task_bugs/1.json
  def show
    @task_bug = TaskBug.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task_bug }
    end
  end

  # GET /task_bugs/new
  # GET /task_bugs/new.json
  def new
    @task_bug = TaskBug.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task_bug }
    end
  end

  # GET /task_bugs/1/edit
  def edit
    @task_bug = TaskBug.find(params[:id])
  end

  # POST /task_bugs
  # POST /task_bugs.json
  def create
    @task_bug = TaskBug.new(params[:task_bug])

    respond_to do |format|
      if @task_bug.save
        format.html { redirect_to @task_bug, notice: 'Task bug was successfully created.' }
        format.json { render json: @task_bug, status: :created, location: @task_bug }
      else
        format.html { render action: "new" }
        format.json { render json: @task_bug.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /task_bugs/1
  # PUT /task_bugs/1.json
  def update
    @task_bug = TaskBug.find(params[:id])

    respond_to do |format|
      if @task_bug.update_attributes(params[:task_bug])
        format.html { redirect_to @task_bug, notice: 'Task bug was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task_bug.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_bugs/1
  # DELETE /task_bugs/1.json
  def destroy
    @task_bug = TaskBug.find(params[:id])
    @task_bug.destroy

    respond_to do |format|
      format.html { redirect_to task_bugs_url }
      format.json { head :no_content }
    end
  end
end

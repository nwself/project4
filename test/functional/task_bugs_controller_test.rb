require 'test_helper'

class TaskBugsControllerTest < ActionController::TestCase
  setup do
    @task_bug = task_bugs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:task_bugs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task_bug" do
    assert_difference('TaskBug.count') do
      post :create, task_bug: { due_date: @task_bug.due_date, estimated_date: @task_bug.estimated_date, percentage_completed: @task_bug.percentage_completed, priority: @task_bug.priority, status: @task_bug.status, task_or_bug: @task_bug.task_or_bug, title: @task_bug.title }
    end

    assert_redirected_to task_bug_path(assigns(:task_bug))
  end

  test "should show task_bug" do
    get :show, id: @task_bug
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task_bug
    assert_response :success
  end

  test "should update task_bug" do
    put :update, id: @task_bug, task_bug: { due_date: @task_bug.due_date, estimated_date: @task_bug.estimated_date, percentage_completed: @task_bug.percentage_completed, priority: @task_bug.priority, status: @task_bug.status, task_or_bug: @task_bug.task_or_bug, title: @task_bug.title }
    assert_redirected_to task_bug_path(assigns(:task_bug))
  end

  test "should destroy task_bug" do
    assert_difference('TaskBug.count', -1) do
      delete :destroy, id: @task_bug
    end

    assert_redirected_to task_bugs_path
  end
end

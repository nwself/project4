require 'test_helper'

class TaskUserProjRelsControllerTest < ActionController::TestCase
  setup do
    @task_user_proj_rel = task_user_proj_rels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:task_user_proj_rels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task_user_proj_rel" do
    assert_difference('TaskUserProjRel.count') do
      post :create, task_user_proj_rel: { task_id: @task_user_proj_rel.task_id, user_project_rel: @task_user_proj_rel.user_project_rel }
    end

    assert_redirected_to task_user_proj_rel_path(assigns(:task_user_proj_rel))
  end

  test "should show task_user_proj_rel" do
    get :show, id: @task_user_proj_rel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task_user_proj_rel
    assert_response :success
  end

  test "should update task_user_proj_rel" do
    put :update, id: @task_user_proj_rel, task_user_proj_rel: { task_id: @task_user_proj_rel.task_id, user_project_rel: @task_user_proj_rel.user_project_rel }
    assert_redirected_to task_user_proj_rel_path(assigns(:task_user_proj_rel))
  end

  test "should destroy task_user_proj_rel" do
    assert_difference('TaskUserProjRel.count', -1) do
      delete :destroy, id: @task_user_proj_rel
    end

    assert_redirected_to task_user_proj_rels_path
  end
end

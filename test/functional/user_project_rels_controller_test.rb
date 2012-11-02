require 'test_helper'

class UserProjectRelsControllerTest < ActionController::TestCase
  setup do
    @user_project_rel = user_project_rels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_project_rels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_project_rel" do
    assert_difference('UserProjectRel.count') do
      post :create, user_project_rel: { project_id: @user_project_rel.project_id, role: @user_project_rel.role, user_id: @user_project_rel.user_id }
    end

    assert_redirected_to user_project_rel_path(assigns(:user_project_rel))
  end

  test "should show user_project_rel" do
    get :show, id: @user_project_rel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_project_rel
    assert_response :success
  end

  test "should update user_project_rel" do
    put :update, id: @user_project_rel, user_project_rel: { project_id: @user_project_rel.project_id, role: @user_project_rel.role, user_id: @user_project_rel.user_id }
    assert_redirected_to user_project_rel_path(assigns(:user_project_rel))
  end

  test "should destroy user_project_rel" do
    assert_difference('UserProjectRel.count', -1) do
      delete :destroy, id: @user_project_rel
    end

    assert_redirected_to user_project_rels_path
  end
end

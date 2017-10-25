require 'test_helper'

class TypeProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_project = type_projects(:one)
  end

  test "should get index" do
    get type_projects_url
    assert_response :success
  end

  test "should get new" do
    get new_type_project_url
    assert_response :success
  end

  test "should create type_project" do
    assert_difference('TypeProject.count') do
      post type_projects_url, params: { type_project: { description: @type_project.description, name: @type_project.name } }
    end

    assert_redirected_to type_project_url(TypeProject.last)
  end

  test "should show type_project" do
    get type_project_url(@type_project)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_project_url(@type_project)
    assert_response :success
  end

  test "should update type_project" do
    patch type_project_url(@type_project), params: { type_project: { description: @type_project.description, name: @type_project.name } }
    assert_redirected_to type_project_url(@type_project)
  end

  test "should destroy type_project" do
    assert_difference('TypeProject.count', -1) do
      delete type_project_url(@type_project)
    end

    assert_redirected_to type_projects_url
  end
end

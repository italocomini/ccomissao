require 'test_helper'

class SeguradorasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seguradoras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create seguradora" do
    assert_difference('Seguradora.count') do
      post :create, :seguradora => { }
    end

    assert_redirected_to seguradora_path(assigns(:seguradora))
  end

  test "should show seguradora" do
    get :show, :id => seguradoras(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => seguradoras(:one).id
    assert_response :success
  end

  test "should update seguradora" do
    put :update, :id => seguradoras(:one).id, :seguradora => { }
    assert_redirected_to seguradora_path(assigns(:seguradora))
  end

  test "should destroy seguradora" do
    assert_difference('Seguradora.count', -1) do
      delete :destroy, :id => seguradoras(:one).id
    end

    assert_redirected_to seguradoras_path
  end
end

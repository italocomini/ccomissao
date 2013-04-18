require 'test_helper'

class ComissaosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comissaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comissao" do
    assert_difference('Comissao.count') do
      post :create, :comissao => { }
    end

    assert_redirected_to comissao_path(assigns(:comissao))
  end

  test "should show comissao" do
    get :show, :id => comissaos(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => comissaos(:one).id
    assert_response :success
  end

  test "should update comissao" do
    put :update, :id => comissaos(:one).id, :comissao => { }
    assert_redirected_to comissao_path(assigns(:comissao))
  end

  test "should destroy comissao" do
    assert_difference('Comissao.count', -1) do
      delete :destroy, :id => comissaos(:one).id
    end

    assert_redirected_to comissaos_path
  end
end

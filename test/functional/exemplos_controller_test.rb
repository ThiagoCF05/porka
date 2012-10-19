require 'test_helper'

class ExemplosControllerTest < ActionController::TestCase
  setup do
    @exemplo = exemplos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exemplos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exemplo" do
    assert_difference('Exemplo.count') do
      post :create, :exemplo => @exemplo.attributes
    end

    assert_redirected_to exemplo_path(assigns(:exemplo))
  end

  test "should show exemplo" do
    get :show, :id => @exemplo.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @exemplo.to_param
    assert_response :success
  end

  test "should update exemplo" do
    put :update, :id => @exemplo.to_param, :exemplo => @exemplo.attributes
    assert_redirected_to exemplo_path(assigns(:exemplo))
  end

  test "should destroy exemplo" do
    assert_difference('Exemplo.count', -1) do
      delete :destroy, :id => @exemplo.to_param
    end

    assert_redirected_to exemplos_path
  end
end

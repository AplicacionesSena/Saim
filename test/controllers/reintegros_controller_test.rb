require 'test_helper'

class ReintegrosControllerTest < ActionController::TestCase
  setup do
    @reintegro = reintegros(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reintegros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reintegro" do
    assert_difference('Reintegro.count') do
      post :create, reintegro: { cuentadante_id: @reintegro.cuentadante_id, elemento_id: @reintegro.elemento_id, fechaReintegro: @reintegro.fechaReintegro }
    end

    assert_redirected_to reintegro_path(assigns(:reintegro))
  end

  test "should show reintegro" do
    get :show, id: @reintegro
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reintegro
    assert_response :success
  end

  test "should update reintegro" do
    patch :update, id: @reintegro, reintegro: { cuentadante_id: @reintegro.cuentadante_id, elemento_id: @reintegro.elemento_id, fechaReintegro: @reintegro.fechaReintegro }
    assert_redirected_to reintegro_path(assigns(:reintegro))
  end

  test "should destroy reintegro" do
    assert_difference('Reintegro.count', -1) do
      delete :destroy, id: @reintegro
    end

    assert_redirected_to reintegros_path
  end
end

require 'test_helper'

class TraspasosControllerTest < ActionController::TestCase
  setup do
    @traspaso = traspasos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:traspasos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create traspaso" do
    assert_difference('Traspaso.count') do
      post :create, traspaso: { cuentadante_id: @traspaso.cuentadante_id, elemento_id: @traspaso.elemento_id, fechaTraspaso: @traspaso.fechaTraspaso }
    end

    assert_redirected_to traspaso_path(assigns(:traspaso))
  end

  test "should show traspaso" do
    get :show, id: @traspaso
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @traspaso
    assert_response :success
  end

  test "should update traspaso" do
    patch :update, id: @traspaso, traspaso: { cuentadante_id: @traspaso.cuentadante_id, elemento_id: @traspaso.elemento_id, fechaTraspaso: @traspaso.fechaTraspaso }
    assert_redirected_to traspaso_path(assigns(:traspaso))
  end

  test "should destroy traspaso" do
    assert_difference('Traspaso.count', -1) do
      delete :destroy, id: @traspaso
    end

    assert_redirected_to traspasos_path
  end
end

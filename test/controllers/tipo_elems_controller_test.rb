require 'test_helper'

class TipoElemsControllerTest < ActionController::TestCase
  setup do
    @tipo_elem = tipo_elems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_elems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_elem" do
    assert_difference('TipoElem.count') do
      post :create, tipo_elem: { descripcion: @tipo_elem.descripcion, nombre: @tipo_elem.nombre }
    end

    assert_redirected_to tipo_elem_path(assigns(:tipo_elem))
  end

  test "should show tipo_elem" do
    get :show, id: @tipo_elem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_elem
    assert_response :success
  end

  test "should update tipo_elem" do
    patch :update, id: @tipo_elem, tipo_elem: { descripcion: @tipo_elem.descripcion, nombre: @tipo_elem.nombre }
    assert_redirected_to tipo_elem_path(assigns(:tipo_elem))
  end

  test "should destroy tipo_elem" do
    assert_difference('TipoElem.count', -1) do
      delete :destroy, id: @tipo_elem
    end

    assert_redirected_to tipo_elems_path
  end
end

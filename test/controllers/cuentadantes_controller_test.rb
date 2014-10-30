require 'test_helper'

class CuentadantesControllerTest < ActionController::TestCase
  setup do
    @cuentadante = cuentadantes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cuentadantes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cuentadante" do
    assert_difference('Cuentadante.count') do
      post :create, cuentadante: { cantidad_elementos: @cuentadante.cantidad_elementos, documento: @cuentadante.documento, nombre: @cuentadante.nombre, nombre_elementos: @cuentadante.nombre_elementos, tipo_doc_id: @cuentadante.tipo_doc_id, valor_elementos: @cuentadante.valor_elementos }
    end

    assert_redirected_to cuentadante_path(assigns(:cuentadante))
  end

  test "should show cuentadante" do
    get :show, id: @cuentadante
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cuentadante
    assert_response :success
  end

  test "should update cuentadante" do
    patch :update, id: @cuentadante, cuentadante: { cantidad_elementos: @cuentadante.cantidad_elementos, documento: @cuentadante.documento, nombre: @cuentadante.nombre, nombre_elementos: @cuentadante.nombre_elementos, tipo_doc_id: @cuentadante.tipo_doc_id, valor_elementos: @cuentadante.valor_elementos }
    assert_redirected_to cuentadante_path(assigns(:cuentadante))
  end

  test "should destroy cuentadante" do
    assert_difference('Cuentadante.count', -1) do
      delete :destroy, id: @cuentadante
    end

    assert_redirected_to cuentadantes_path
  end
end

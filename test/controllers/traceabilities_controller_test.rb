require 'test_helper'

class TraceabilitiesControllerTest < ActionController::TestCase
  setup do
    @traceability = traceabilities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:traceabilities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create traceability" do
    assert_difference('Traceability.count') do
      post :create, traceability: { cuentadantes_id: @traceability.cuentadantes_id, elementos_id: @traceability.elementos_id, events_id: @traceability.events_id, reintegros_id: @traceability.reintegros_id, traspasos_id: @traceability.traspasos_id, users_id: @traceability.users_id }
    end

    assert_redirected_to traceability_path(assigns(:traceability))
  end

  test "should show traceability" do
    get :show, id: @traceability
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @traceability
    assert_response :success
  end

  test "should update traceability" do
    patch :update, id: @traceability, traceability: { cuentadantes_id: @traceability.cuentadantes_id, elementos_id: @traceability.elementos_id, events_id: @traceability.events_id, reintegros_id: @traceability.reintegros_id, traspasos_id: @traceability.traspasos_id, users_id: @traceability.users_id }
    assert_redirected_to traceability_path(assigns(:traceability))
  end

  test "should destroy traceability" do
    assert_difference('Traceability.count', -1) do
      delete :destroy, id: @traceability
    end

    assert_redirected_to traceabilities_path
  end
end

require 'test_helper'

class TechnicalsControllerTest < ActionController::TestCase
  setup do
    @technical = technicals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:technicals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create technical" do
    assert_difference('Technical.count') do
      post :create, technical: { especialidad: @technical.especialidad, horaE: @technical.horaE, horaS: @technical.horaS, name: @technical.name, ststus: @technical.ststus, user_id: @technical.user_id }
    end

    assert_redirected_to technical_path(assigns(:technical))
  end

  test "should show technical" do
    get :show, id: @technical
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @technical
    assert_response :success
  end

  test "should update technical" do
    patch :update, id: @technical, technical: { especialidad: @technical.especialidad, horaE: @technical.horaE, horaS: @technical.horaS, name: @technical.name, ststus: @technical.ststus, user_id: @technical.user_id }
    assert_redirected_to technical_path(assigns(:technical))
  end

  test "should destroy technical" do
    assert_difference('Technical.count', -1) do
      delete :destroy, id: @technical
    end

    assert_redirected_to technicals_path
  end
end

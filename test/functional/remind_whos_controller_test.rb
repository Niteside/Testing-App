require 'test_helper'

class RemindWhosControllerTest < ActionController::TestCase
  setup do
    @remind_who = remind_whos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:remind_whos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create remind_who" do
    assert_difference('RemindWho.count') do
      post :create, remind_who: { recipient: @remind_who.recipient, reminder_id: @remind_who.reminder_id }
    end

    assert_redirected_to remind_who_path(assigns(:remind_who))
  end

  test "should show remind_who" do
    get :show, id: @remind_who
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @remind_who
    assert_response :success
  end

  test "should update remind_who" do
    put :update, id: @remind_who, remind_who: { recipient: @remind_who.recipient, reminder_id: @remind_who.reminder_id }
    assert_redirected_to remind_who_path(assigns(:remind_who))
  end

  test "should destroy remind_who" do
    assert_difference('RemindWho.count', -1) do
      delete :destroy, id: @remind_who
    end

    assert_redirected_to remind_whos_path
  end
end

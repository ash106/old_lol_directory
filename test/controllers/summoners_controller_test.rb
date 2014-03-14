require 'test_helper'

class SummonersControllerTest < ActionController::TestCase
  setup do
    @summoner = summoners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:summoners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create summoner" do
    assert_difference('Summoner.count') do
      post :create, summoner: { acct_id: @summoner.acct_id, icon_id: @summoner.icon_id, name: @summoner.name, riot_id: @summoner.riot_id, server: @summoner.server, user_id: @summoner.user_id }
    end

    assert_redirected_to summoner_path(assigns(:summoner))
  end

  test "should show summoner" do
    get :show, id: @summoner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @summoner
    assert_response :success
  end

  test "should update summoner" do
    patch :update, id: @summoner, summoner: { acct_id: @summoner.acct_id, icon_id: @summoner.icon_id, name: @summoner.name, riot_id: @summoner.riot_id, server: @summoner.server, user_id: @summoner.user_id }
    assert_redirected_to summoner_path(assigns(:summoner))
  end

  test "should destroy summoner" do
    assert_difference('Summoner.count', -1) do
      delete :destroy, id: @summoner
    end

    assert_redirected_to summoners_path
  end
end

require 'test_helper'

class BeritasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:beritas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create berita" do
    assert_difference('Berita.count') do
      post :create, :berita => { }
    end

    assert_redirected_to berita_path(assigns(:berita))
  end

  test "should show berita" do
    get :show, :id => beritas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => beritas(:one).to_param
    assert_response :success
  end

  test "should update berita" do
    put :update, :id => beritas(:one).to_param, :berita => { }
    assert_redirected_to berita_path(assigns(:berita))
  end

  test "should destroy berita" do
    assert_difference('Berita.count', -1) do
      delete :destroy, :id => beritas(:one).to_param
    end

    assert_redirected_to beritas_path
  end
end

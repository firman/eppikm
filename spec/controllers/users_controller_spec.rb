require 'spec_helper'

describe UsersController do
  integrate_views

  #Delete these examples and add some real ones

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end

    it "should have the right title" do
      get :new
      response.should have4_tag("title", /sign up/)
    end
  end
end


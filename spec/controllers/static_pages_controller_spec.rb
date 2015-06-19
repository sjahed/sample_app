require 'spec_helper'

describe StaticPagesController do

  describe "GET 'home'" do
  	  render_views
    it "returns http success" do
      get 'home'
      response.should be_success
    end
  end

  describe "GET 'help'" do
  	  render_views
    it "returns http success" do
      get 'help'
      response.should be_success
    end
  end

  describe "GET 'about'" do
  	  render_views
  	  it "returns http success" do
  	  	  get 'about'
  	  	  response.should be_success
	  end
  end

  describe "Get 'contact'" do
  	  it "returns http success" do
  	  	  get 'contact'
  	  	  response.should be_success
	  end
  end
end

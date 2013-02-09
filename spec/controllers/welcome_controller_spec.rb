require 'spec_helper'

describe WelcomeController do

  context "GET index" do
    it "succeeds" do
      get :index
      response.should be_success
    end
  end

end

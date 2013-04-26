require 'spec_helper'

describe IndexController do

  describe "GET 'index'" do
    it "index be redirect to sign_in" do
      get 'index'
      response.should redirect_to(new_user_session_path)    
    end
  end

end

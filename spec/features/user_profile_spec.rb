require 'spec_helper'

describe "user profile" do

  before do
    user = FactoryGirl.build(:user)
    login_user(user)
    visit login_path
    click_on "Sign in with Fitbit"
  end

 
  
end

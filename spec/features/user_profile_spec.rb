require 'spec_helper'

describe "user profile", :vcr do
  attr_reader :user

  before do
    @user = FactoryGirl.build(:user)
    login_user(user)
    visit login_path
    click_on "Sign in with Fitbit"
    click_link "View My Profile"
  end

  it "displays information" do 
    expect(page).to have_content user.name
  end
 
  it "has a button to set goals" do 
    expect(page).to have_link "Set Goal"
  end
  
end

require 'spec_helper'

describe "user profile", :vcr do
  attr_reader :user

  before do
    @user = FactoryGirl.build(:user)
    login_user(user)
    visit login_path
    click_on "Sign in with Fitbit"
  end

  it "displays information" do
    click_link "View My Profile"
    expect(page).to have_content user.name
  end


end

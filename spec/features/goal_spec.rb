require 'spec_helper'

describe "goal setting page", :vcr do
  attr_reader :user

  before do
    @user = FactoryGirl.build(:user)
    login_user(user)
    visit login_path
    click_on "Sign in with Fitbit"
    click_link "View My Profile"
    click_link "Set or Edit Goals"
  end

  it "displays form to input goals" do 
    expect(page).to have_content("#{user.name}'s Goals")
  end

end

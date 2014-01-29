require 'spec_helper'

describe "dashboard index" do

  before do
    user = FactoryGirl.create(:user)
    puts user.valid?
    puts user.inspect

    FitbitStats.new(user)
    login_user(user)
    visit login_path
    click_on "Sign in with Fitbit"
  end

  it "has views for sleep and steps" do
    expect(page).to have_content 'steps'
  end

  it "has views for sleep" do 
    save_and_open_page
    expect(page).to have_content 'minutes'
  end

  xit "has a View User Profile button" do
    expect(page).to have_content 'My Profile'
  end
  
end

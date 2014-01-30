require 'spec_helper'

describe "dashboard index", :vcr do
  before do
    user = FactoryGirl.create(:user)
    FitbitStats.new(user)
    login_user(user)
    visit login_path
    click_on "Sign in with Fitbit"
  end

  it "has views for sleep and steps" do
    expect(page).to have_content 'steps'
  end

  it "has views for sleep" do
    expect(page).to have_content 'minutes'
  end

  it "has a View User Profile button" do
    expect(page).to have_content 'View My Profile'
  end

end

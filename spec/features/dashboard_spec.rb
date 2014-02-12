require 'spec_helper'

describe "dashboard index", :vcr do

  before do
    @user = FactoryGirl.create(:user)
    food = FactoryGirl.create(:food, user_id: @user.id, calories: 34532349)
    login_user(@user)
    visit login_path
    click_on "Sign in with Fitbit"
  end

  it "has views for sleep and steps" do
    expect(page).to have_content 'steps'
  end

  it "has views for sleep" do
    expect(page).to have_content 'sleep last night'
  end

  it "has a View User Profile button" do
    expect(page).to have_content 'View My Profile'
  end

  it "has a User's fitbit goals or No Goal Set if goal = 0" do
    expect(page).to have_content(@user.goal.steps)
    current_user.goal.steps = 10000
    current_user.goal.sleep = 8.0
    visit root_path
    save_and_open_page
    expect(page).to have_content(@user.goal.steps)
    expect(page).to have_content(@user.goal.sleep)
  end

  it "shows Nutrition and Carorie information" do
    expect(page).to have_content "Nutrition"
    expect(page).to have_content "Calories"
  end

end

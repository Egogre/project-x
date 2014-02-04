require 'spec_helper'

describe "dashboard index", :vcr do

  before do
    @user = FactoryGirl.create(:user)
    food = FactoryGirl.create(:food, user_id: @user.id, calories: 34532349)
    FitbitStats.new(@user)
    login_user(@user)
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

  it "has a User's food daily food info" do 
    expect(page).to have_content(@user.daily_calorie_total)
    expect(page).to have_content(@user.daily_fat_total)
    expect(page).to have_content(@user.daily_protein_total)
    expect(page).to have_content(@user.daily_carb_total)
    expect(page).to have_content(@user.daily_fiber_total)
  end

end

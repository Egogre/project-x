require 'spec_helper'

describe "user profile", :vcr do
  attr_reader :user

  before do
    @user = FactoryGirl.build(:user)
    @goal = FactoryGirl.create(:goal)
    @food = FactoryGirl.create(:food)
    login_user(user)
    visit login_path
    click_on "Sign in with Fitbit"
    click_link "View My Profile"
  end

  it "displays information" do 
    expect(page).to have_content user.name
  end

  it "has a User's food daily food info" do 
    expect(page).to have_content(@user.calorie_total_for(Date.today))
    expect(page).to have_content(@user.protein_total_for(Date.today))
    expect(page).to have_content(@user.fiber_total_for(Date.today))
    expect(page).to have_content(@user.fat_total_for(Date.today))
    expect(page).to have_content(@user.carb_total_for(Date.today))
  end
 
  it "has a button to set goals" do
    expect(page).to have_link "Edit Goals"
  end
  
end

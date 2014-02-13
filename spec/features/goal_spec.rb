require 'spec_helper'

describe "goal setting page", :vcr do
  attr_reader :user

  before do
    @user = FactoryGirl.build(:user)
    @goal = FactoryGirl.create(:goal, user_id: user.id)
    @food = FactoryGirl.create(:food)
    login_user(user)
    visit login_path
    click_on "Sign in with Fitbit"
    click_link "View My Profile"
    click_link "Edit Goals"
  end

  it "user can input and view goal" do 
    fill_in 'Steps', with: 1000
    fill_in 'Sleep', with: 480
    fill_in 'Calories', with: 2000
    fill_in 'Carbohydrates', with: 40
    fill_in 'Fat', with: 20
    fill_in 'Protein', with: 20
    click_on 'Update Goal'
    expect(page).to have_content('Weekly Stats')
  end

end

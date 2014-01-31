require 'spec_helper'

describe "goal setting page", :vcr do
  attr_reader :user

  before do
    @user = FactoryGirl.build(:user)
    login_user(user)
    visit login_path
    click_on "Sign in with Fitbit"
    click_link "View My Profile"
    click_link "Set Goal"
  end

  it "displays form to input goal" do 
    expect(page).to have_content("#{user.name}'s Goal")
  end

  it "user can input and view goal" do 
    fill_in 'Steps', with: 1000
    fill_in 'Sleep', with: 480
    fill_in 'Calories', with: 2000
    fill_in 'Carbohydrates', with: 40
    fill_in 'Fat', with: 20
    fill_in 'Protein', with: 20
    click_on 'Create Goal'
    expect(page).to have_content("View Goal")
    click_on("View Goal")
    within('.current-goal') do
      expect(page).to have_content(user.goals.first.steps)
    end
  end

end

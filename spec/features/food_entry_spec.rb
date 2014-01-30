require 'spec_helper'

describe "food entry page" do
  before do
    user = FactoryGirl.build(:user)
    login_user(user)
    visit login_path
    click_on "Sign in with Fitbit"
  end
  it "can search for food" do
    click_on "Add Food"
    expect(current_path).to eq new_food_path
    within('.search-form') do
      expect(page).to have_content('Search for Food')
    end
  end
  it "can select serving size for chosen food"
  it "can select quantity for chosen food"
  it "can add food to profile and see on dashboard"
end

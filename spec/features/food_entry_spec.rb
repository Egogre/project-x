require 'spec_helper'

describe "food entry page" do
  before do
    user = FactoryGirl.build(:user)
    login_user(user)
    visit login_path
    click_on "Sign in with Fitbit"
  end
  it "can search for food I ate" do
    click_on "Add Food"
    fill_in 'food_search[food]', :with => "waffle"
    click_on "Search"
    within('.search-results') do
      expect(page).to have_content('Waffles Plain')
    end
  end
  it "can select serving size for chosen food"
  it "can select quantity for chosen food"
  it "can add food to profile and see on dashboard"
end

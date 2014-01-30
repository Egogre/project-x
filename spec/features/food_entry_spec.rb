require 'spec_helper'

describe "food entry page", :vcr do
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
  it "can search, select serving and qty and add food to profile" do
    click_on "Add Food"
    fill_in 'food_search[food]', :with => "waffle"
    click_on "Search"
    select('1 miniature', :from => 'serving_size')
    select('1', :from => 'Qty')
    click_on "Submit"
    expect(page).to have_content('miniature')
  end
end

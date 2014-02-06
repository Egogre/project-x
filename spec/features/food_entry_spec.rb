require 'spec_helper'


describe "food entry page" do
  before do
    VCR.use_cassette('login') do
      user = FactoryGirl.build(:user)
      @goals = FactoryGirl.create(:goal)
      @food = FactoryGirl.create(:food)
      login_user(user)
      visit login_path
      click_on "Sign in with Fitbit"
    end
  end

  it "can search, select serving and qty and add food to profile" do
    VCR.use_cassette('add_food') do
      within("#add-food-button") do 
        click_on "Add Food"
      end
      fill_in 'food_search[food]', :with => "waffle"
      click_on "Search"
    end
    VCR.use_cassette('select_waffle') do
      within('.search-results') do
        click_on "Plain Waffle"
      end
    end
    select('1 miniature', :from => 'serving_id')
    select('1', :from => 'quantity')
    VCR.use_cassette('submit_selection') do
      click_on "Submit"
    end
    expect(page).to have_content('Steps')
    # expect(page).to have_content('miniature')
    expect(page).to have_content('calories')
    expect(page).to have_content('carbohydrates')
    expect(page).to have_content('fat')
    expect(page).to have_content('protein')
    expect(page).to have_content('fiber')
  end

end

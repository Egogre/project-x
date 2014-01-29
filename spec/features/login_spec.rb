require 'spec_helper'

describe "dashboard index" do

  before do
    user = FactoryGirl.build(:user)
    login_user(user)
    visit login_path
    click_on "Sign in with Fitbit"
  end

  it "views steps" do
    expect(page).to have_content 'steps'
  end
end

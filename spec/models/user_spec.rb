require 'spec_helper'

describe User do

  before do
    @user = FactoryGirl.create(:user)
    food1 = FactoryGirl.create(:food, user_id: @user.id)
    food2 = FactoryGirl.create(:food, user_id: @user.id, calories: 5, protein: 4, fat: 3, carbs: 2, fiber: 1)
    stat = FactoryGirl.create(:stat, user_id: @user.id, steps: 10, sleep: 5, date: Date.today)
    stat2 = FactoryGirl.create(:stat, user_id: @user.id, steps: 20, sleep: 50, date: Date.yesterday)
  end

  it "can have a total for each food category" do
    expect(@user.calorie_total_for(Date.today)).to eq 6
    expect(@user.protein_total_for(Date.today)).to eq 5
    expect(@user.fat_total_for(Date.today)).to eq 4
    expect(@user.carb_total_for(Date.today)).to eq 3
    expect(@user.fiber_total_for(Date.today)).to eq 2
  end

  it "has an average of stats" do 
    expect(@user.average_steps).to eq 15
    expect(@user.average_sleep).to eq 27.5
  end
end

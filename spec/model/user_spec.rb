require 'spec_helper'

describe User do

  before do
    @user = FactoryGirl.create(:user)
    food1 = FactoryGirl.create(:food, user_id: @user.id)
    food2 = FactoryGirl.create(:food, user_id: @user.id, calories: 5, protein: 4, fat: 3, carbs: 2, fiber: 1)
  end

  it "can have a total for each food category" do
    expect(@user.calorie_total_for(Date.today)).to eq 6
    expect(@user.protein_total_for(Date.today)).to eq 5
    expect(@user.fat_total_for(Date.today)).to eq 4
    expect(@user.carb_total_for(Date.today)).to eq 3
    expect(@user.fiber_total_for(Date.today)).to eq 2
  end
end

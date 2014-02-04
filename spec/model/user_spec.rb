require 'spec_helper'

describe User do

  before do
    @user = FactoryGirl.create(:user)
    food1 = FactoryGirl.create(:food, user_id: @user.id)
    food2 = FactoryGirl.create(:food, user_id: @user.id, calories: 5, protein: 4, fat: 3, carbs: 2, fiber: 1)
  end

  it "can have a total for each food category" do
    expect(@user.daily_calorie_total).to eq 6
    expect(@user.daily_protein_total).to eq 5
    expect(@user.daily_fat_total).to eq 4
    expect(@user.daily_carb_total).to eq 3
    expect(@user.daily_fiber_total).to eq 2
  end
end

require 'spec_helper'

describe FatsecretAPI do
  it "can search for food items", :vcr do
    results = FatsecretAPI.search("waffle")
    expect(results).to eq [Foods::SearchItem.new("Plain Waffle", "4374", "Per 100g - Calories: 310kcal | Fat: 9.55g | Carbs: 48.84g | Protein: 7.30g")]
  end
end

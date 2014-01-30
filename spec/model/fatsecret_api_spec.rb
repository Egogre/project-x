require 'spec_helper'

describe FatsecretAPI do
  it "can search for food items" do
    VCR.use_cassette 'FatsecretAPI/api_response' do
      results = FatsecretAPI.search("waffle")
      item = Foods::SearchItem.new("Plain Waffle", "4374", "Per 100g - Calories: 310kcal | Fat: 9.55g | Carbs: 48.84g | Protein: 7.30g")
      expect(results[0].name).to eq item.name
    end
  end
end

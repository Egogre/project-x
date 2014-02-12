require 'spec_helper'

describe FoodsController, :vcr do 
  let(:valid_params) do
    {serving_id: 1, quantity: 1}
  end

  let(:user) do
    FactoryGirl.create(:user)
  end

  describe "POST create" do
    before do
      ApplicationController.any_instance.stub(:current_user).and_return(user)
      # FatsecretAPI.food
    end

    xit "saves food to database" do
      VCR.use_cassette('save_food') do 
        post :create, valid_params 
      end
    end
  end

end

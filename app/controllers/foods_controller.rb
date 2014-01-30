class FoodsController < ApplicationController

  #search page
  def index
    #this page will have the search field
    #will eventually show a list of popular previous entries
  end

  #this will run Fatscret get method and show serving sizes
  def show
    @food = FatsecretAPI.get(params[:id])
  end

  #this will run the search
  def search
    @foods = FatsecretAPI.search(params["food_search"]["food"])
  end

  def update
    binding.pry
    #use food_id to use FatSecret get method for food
    #update food table for current user
  end

  def update_params
    {
      "utf8"=>"✓",
      "_method"=>"put",
      "authenticity_token"=>"+ncEpXA4L3XU0/Moch71c2GdrC4yJqIHalzNzgpx9Yw=",
      "serving_size"=>"15826",
      "quantity"=>"1",
      "commit"=>"Submit",
      "action"=>"update",
      "controller"=>"foods",
      "id"=>"4374"
    }
  end

end

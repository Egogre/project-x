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

  def create
    food = Food.new(create_food_params)
    
    if food.save
      flash[:notice] = "Food saved!"
      redirect_to root_path
    else
      flash[:notice] = "Food NOT saved! Please try again."
      render 'foods#show'
    end
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

  def food_params
    params.permit(:serving_id, :quantity).merge(user_id: current_user.id)
  end

  def create_food_params
    food_params.merge(FatsecretAPI.food_create_params(food_params[:serving_id]))
  end

end

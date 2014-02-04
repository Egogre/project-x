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
    #params has quantity, serving_size (id) and id (food_id)
    food = Food.new
    food.user_id = current_user.id
    # food.consumed_on = params['food']['consumed_on(1i)']
    food.quantity = params['quantity']
    search_item = FatsecretAPI.food
    food.food_id = search_item.id.to_i
    food.name  = search_item.name
    serving = search_item.find_serving(params['serving_id'])
    food.serving_id = serving['serving_id']
    food.serving_description = serving['serving_description']
    food.calories = serving["calories"].to_i
    food.protein = serving["protein"].to_f
    food.fat = serving["fat"].to_f
    food.carbs = serving["carbohydrate"].to_f
    food.fiber = serving["fiber"].to_f
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

end

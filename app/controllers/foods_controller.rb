class FoodsController < ApplicationController

  def lookup

  end

  def search
    FatsecretAPI.search(params["food_search"]["food"])
  end

end

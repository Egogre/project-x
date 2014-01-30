class FoodsController < ApplicationController

  def lookup
    #this page will have the search field
    #will eventually show a list of popular previous entries
  end

  def search
    @foods = FatsecretAPI.search(params["food_search"]["food"])
  end

end

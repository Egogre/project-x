module Foods
  class SearchItem
    include ActiveModel::Model

    attr_reader :name, :id, :description, :consumed_on, :servings

    def initialize(name, id, description = "", servings)
      @name = name
      @id = id
      @description = description
      @servings = servings
      @consumed_on = Date.today
    end

    def servings_array
      @servings.map { |serving| [serving["serving_description"], serving["serving_id"]] }
    end

    def find_serving(id)
      servings.find { |serving| serving['serving_id'] == id }
    end

  end
end

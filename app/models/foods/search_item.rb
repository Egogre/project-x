module Foods
  class SearchItem
    include ActiveModel::Model

    attr_reader :name, :id, :description

    def initialize(name, id, description = "", servings)
      @name = name
      @id = id
      @description = description
      @servings = servings
    end

    def servings_array
      @servings.map { |serving| [serving["serving_description"], serving["serving_id"]] }
    end

  end
end

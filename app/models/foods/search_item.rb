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
      if servings.kind_of?(Array)
        servings.map { |serving| [serving["serving_description"], serving["serving_id"]] }
      else
        [[servings["serving_description"], servings["serving_id"]]]
      end
    end

    def find_serving(id)
      if servings.kind_of?(Array)
        servings.find { |serving| serving['serving_id'] == id }
      else
        servings
      end
    end

  end
end

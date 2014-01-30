module Foods
  class SearchItem
    attr_reader :name, :id, :description

    def initialize(name, id, description)
      @name = name
      @id = id
      @description = description
    end

  end
end

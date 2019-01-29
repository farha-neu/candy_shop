class Shelf
    
    attr_reader :name, :candies

    def initialize(name)
        @candies = []
        @name = name
    end
    
end
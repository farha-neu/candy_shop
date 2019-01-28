class Shelf
   
    attr_accessor :shelf_name, :candies

    def initialize(name)
       @candies = []
       @shelf_name = name
    end

    def add_candy(name)
        @candies << Candy.new(name, true)
    end

    def move_candy(candy)
        candy.is_shelved = true
        @candies << candy
    end

    def remove_candy(candy)
        @candies.delete_at(@candies.find_index(candy))
    end

end
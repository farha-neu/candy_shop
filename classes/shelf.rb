class Shelf
    
    attr_reader :name, :candies

    def initialize(name)
        @candies = []
        @name = name
    end
    
    def add_candy(candy)
        candy.is_shelved = true
        @candies << candy
        puts "\nCandy #{candy.name} moved to shelf #{@name}!"
    end

    def remove_candy

    end
   

    def display_candies
        if(@candies.length > 0)
            puts "Candies in Shelf #{@name}:"
            i = 0
            for candy in @candies
                i+=1
                puts "#{i}. #{candy.name}"
            end
        end
    end
end
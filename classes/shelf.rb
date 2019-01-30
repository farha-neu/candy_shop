class Shelf
    
    attr_reader :name, :candies

    def initialize(name)
        @candies = []
        @name = name
    end
    
    def add_candy(candy)
        candy.is_shelved = true
        @candies << candy
        puts "Candy #{candy.name} moved to shelf #{@name}!"
    end

    def remove_candy(candy_index)
       @candies.delete_at(candy_index)
       puts "\nCandy removed from shelf!"
    end
   

    def display_candies(i)
        if(@candies.length > 0)
            puts "\nCandies in Shelf #{@name}:"
            for candy in @candies
                i+=1
                puts "#{i}. #{candy.name}"
            end
        end
        i
    end
end
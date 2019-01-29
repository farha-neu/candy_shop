class Shop

    attr_reader :shelves, :unshelved_candies

    def initialize
        @shelves = []
        @unshelved_candies = []
    end


    def add_shelf(name)
        if(!find_if_duplicate_shelf_exists(name))
             @shelves << Shelf.new(name)
             puts "\nNew Shelf #{name} added."
             true
        else
            puts "\nShelf exists. Choose a different name."
            false
        end
    end


    def remove_shelf(shelf_number)
        make_candies_unshelved(@shelves[shelf_number-1])
        @shelves.delete_at(shelf_number-1)
        puts "\nShelf deleted!"
    end

 
    def display_shelves
       display("Shelves",@shelves)
    end


    def list_unshelved_candies
       display("Unshelved candies",@unshelved_candies)
    end


    def add_candy(name)
        @unshelved_candies << Candy.new(name,false)
        puts "\nNew candy added!"
    end


    def move_candy_to_shelf(candy_number,shelf_number)
        candy = @unshelved_candies[candy_number-1]
        shelf = @shelves[shelf_number-1]
        @unshelved_candies.delete_at(candy_number-1)
        shelf.add_candy(candy)
    end


    def list_candies
        if(@unshelved_candies.length>0)
            display("Unshelved candies",@unshelved_candies)
        end
    end

   

    def list_shelved_candies
        if(count_shelved_candies>0)
            puts "\n------------------------------"
            puts "      Shelved Candies: #{count_shelved_candies}"
            puts "------------------------------"
            for shelf in @shelves
                shelf.display_candies
            end
        end
    end



    def count_shelved_candies
        count = 0
        for shelf in @shelves
            count+=shelf.candies.length
        end
        count
    end

    
    private
        def find_if_duplicate_shelf_exists(name)
           @shelves.find_index{|shelf| shelf.name == name}
        end

        def make_candies_unshelved(shelf)
            if(shelf.candies.length > 0)
                shelf.candies.map {|candy| candy.is_shelved=false }
                @unshelved_candies+=shelf.candies
                puts @unshelved_candies
            end
        end     

        def display(name,arr)
            puts "\n------------------------------"
            puts "    #{name}: #{arr.length}     "
            puts "------------------------------"
            i = 0
            for item in arr
               i+=1
               puts "#{i}. #{item.name}"
            end
            puts
        end
end
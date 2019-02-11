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


    def move_candy_from_shelf(candy_number)
        i = 0
       for shelf in @shelves
           if(shelf.candies.length>0)
              index = -1
              for candy in shelf.candies
                i+=1
                index+=1
                if(i==candy_number)
                    @unshelved_candies << candy
                    shelf.remove_candy(index)
                    break
                 end
              end
           end
       end
    end

    def display_all_candies
        if(@unshelved_candies.length<=0 && count_shelved_candies<=0)
            puts "No candies to display"
        else
            list_candies
            list_shelved_candies
        end
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

   def display_candies_with_shelve
     i = 0
     for shelf in @shelves
        i = shelf.display_candies_for_removal(i)
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
            end
        end     

        def display(name,arr)
            puts "\n------------------------------"
            puts "    #{name}: #{arr.length}     "
            puts "------------------------------"
            arr.each.with_index(1) do |candy, index|
               puts "#{index}. #{candy.name}"
            end
            puts
        end
end
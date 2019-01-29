class Shop

    attr_reader :shelves

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
        @shelves.delete_at(shelf_number-1)
        #make candies unshelved
        puts "\nShelf deleted!"
    end


    
    def display_shelves
       i = 0
       puts "\n------------------------------"
       puts "           Shelves              "
       puts "------------------------------"
       for shelf in @shelves
          i+=1
          puts "#{i}. #{shelf.name}"
       end
       puts
    end

   

    private
        def find_if_duplicate_shelf_exists(name)
           @shelves.find_index{|shelf| shelf.name == name}
        end
        
       
       
end
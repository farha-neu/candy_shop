class Shop

    # attr_accessor :shelves

    def initialize
        @shelves=[]
        @unshelved_candies=[]
    end
 
    def add_shelf(name)
        @shelves << Shelf.new(name)
    end

    def remove_shelf(value)
        for s in @shelves
            if(s.shelf_name==value)
                candies_arr = s.candies
                candies_arr.map {|c| c.is_shelved=false }
                @unshelved_candies+=candies_arr
                @shelves.delete(s)
                break
            end
        end
    end

    def display_shelves
        for s in @shelves
            puts "Shelf - #{s.shelf_name}"
            # for c in s.candies
            #     puts c.name
            # end
        end
    end

    def count_shelves
        @shelves.length
    end

    def add_candy_unshelved(name)
        @unshelved_candies << Candy.new(name, false)
    end

    def add_candy_shelved(name,candy)
       s= @shelves.select { |shelf| shelf.shelf_name == name }[0]
       s.add_candy(candy)
    end

    def count_candies
        @unshelved_candies.length
    end

    def list_unshelved_candies
        for candy in @unshelved_candies
            puts "#{candy.name} - #{candy.is_shelved}"
        end
    end

    def list_shelved_candies
        for s in @shelves
            cand = s.candies
            for c in cand
                puts "#{c.name} - #{c.is_shelved}"
            end
        end
    end

    def move_from_unshelved_to_shelved(candy, name)
        c =  @unshelved_candies.find { |c| c.name == candy }
        s= @shelves.find { |shelf| shelf.shelf_name == name }
        s.move_candy(c)
    end

    def move_from_shelved_to_unshelved(candy,name)
        s= @shelves.find { |shelf| shelf.shelf_name == name }
        candies_in_s = s.candies
        cand =  candies_in_s.find { |c| c.name == candy }
        cand.is_shelved = false
        @unshelved_candies << cand
        s.remove_candy(cand)
    end
end
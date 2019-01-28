#!/usr/bin/env ruby

require_relative 'classes/shop'
require_relative 'classes/shelf'
require_relative 'classes/candy'

shop = Shop.new

shop.add_shelf(1)
shop.add_shelf(2)

# shop.display_shelves

# puts shop.add_candy_shelved(1,"frooty")
shop.add_candy_unshelved("hi")
shop.add_candy_shelved(1, "toofy")
shop.add_candy_shelved(1, "fy")
shop.add_candy_shelved(2, "goofy")
# shop.list_unshelved_candies

puts "_________shelved"
shop.list_shelved_candies
puts "_________unshelved"
shop.list_unshelved_candies
shop.remove_shelf(1)

puts "_________shelved"
# shop.list_unshelved_candies
shop.list_shelved_candies
puts "_________unshelved"
shop.list_unshelved_candies

shop.move_from_unshelved_to_shelved("hi",2)
puts "_________shelved"
# shop.list_unshelved_candies
shop.list_shelved_candies

shop.move_from_shelved_to_unshelved("hi",2)
puts "_________shelved"
# shop.list_unshelved_candies
shop.list_shelved_candies
puts "_________unshelved"
# shop.list_unshelved_candies
shop.list_unshelved_candies
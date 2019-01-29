#!/usr/bin/env ruby

require_relative 'classes/shop'
require_relative 'classes/shelf'
require_relative 'classes/candy'



def display_welcome_message
    puts "-----------------------------------------"
    puts "|        Welcome to Candy Shop           |"
    puts "-----------------------------------------\n"
    puts
end

def display_menu
    loop do
        puts "\nSelect an option:"
        puts "1. Add shelf"
        puts "2. Remove shelf"
        puts "3. Add candy"
        puts "4. Remove candy"
        puts "5. Move candy to shelf"
        puts "6. Remove candy from shelf"
        puts "7. View all candies"
        puts "8. Exit"
        print "\nEnter option[e.g. 1]> "
        select_option
    end
end


def select_option
    option = gets.chomp.to_i
    case option
        when 1
            add_new_shelf
        when 2
            remove_shelf
        when 3
            puts "Candy added"
        when 4
            puts "Candy removed"
        when 5
            puts "Moved candy to shelf"
        when 6
            puts "Removed candy from shelf"
        when 7
            puts "Listing all candies"
        when 8
            puts "Leaving candy shop"
            exit!
        else
            puts "Enter a valid option"
    end
end

def add_new_shelf
    puts "Enter the name of shelf:"
    print "> "
    shelf_name = gets.chomp
    unless($shop.add_shelf(shelf_name))
        add_new_shelf
    end
end

def remove_shelf
    if($shop.shelves.length>0)
        $shop.display_shelves
        remove_shelf_with_input_validation
    else
        puts "\nNo shelf exists!"
    end
end

def remove_shelf_with_input_validation
    puts "Enter the shelf number to remove:[e.g. 2]"
    print "> "
    shelf_number = gets.chomp.to_i
    is_valid_option = (1..$shop.shelves.length+1).any? {|n| n == shelf_number}
    if(is_valid_option)
       $shop.remove_shelf(shelf_number)
    else
        puts "\nEnter a valid shelf number\n\n"
        remove_shelf_with_input_validation
    end
end


$shop = Shop.new
display_welcome_message
display_menu

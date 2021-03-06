require 'shop/version'
require 'modules/customer'
require 'modules/shopkeeper'
require 'modules/file_handling'

include Customer
include Shopkeeper
include FileHandling
# !usr/bin/env ruby
class ShopInventory
  puts Dir.pwd
  def display_product_info
    puts file_open
  end

  def search_products
    contents = file_open
    puts 'enter product id'
    product_id = gets.chomp
    searched_product = /#{product_id}\s\w+\s\d+\s\d+\s\w+/.match(contents)
    puts searched_product
  end

  def display_menu
    puts '1.shopkeeper'
    puts '2.customer'
    puts 'enter type of user'
    user = gets.chomp
    if user == '1'
      choice = 0
    while choice != '6'
      puts '1.ADD PRODUCT'
      puts '2.REMOVE PRODUCT'
      puts '3.LIST PRODUCTS'
      puts '4.SEARCH PRODUCT'
      puts '5.EDIT PRODUCT'
      puts '6.EXIT'
      puts 'ENTER YOUR CHOICE'
      choice = gets.chomp
      case choice
      when '1'
        add_products
      when '2'
        remove_products
      when '3'
        display_product_info
      when '4'
        search_products
      when '5'
        edit_product
      else
        puts 'ENTER VALID CHOICE'
      end
    end
    elsif user == '2'
      choice = 0
      while choice != '4'
      puts '1.LIST PRODUCTS'
      puts '2.SEARCH PRODUCT'
      puts '3.BUY PRODUCTS'
      puts '4.EXIT'
      puts 'ENTER YOUR CHOICE'
      choice = gets.chomp
      case choice
      when '1'
        display_product_info
      when '2'
        search_products
      when '3'
        buy_products
      else
        puts 'ENTER VALID CHOICE'
      end
      end
    else
      puts 'ENTER VALID USER'
    end
  end
end
# cust = Customer.new
# shpkpr = Shopkeeper.new


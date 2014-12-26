require_relative 'file_handling.rb'

include FileHandling
# shopkeeper module
module Shopkeeper
  def add_products
    puts 'no of products'
    no = gets.chomp
    no = no.to_i
    contents = file_open
    if contents.nil?
      id = 1
    else
      last = last_Record
      last_id = last[0]
      id = last_id.to_i + 1
    end
    while no > 0
      puts 'enter product name='
      name = gets.chomp
      puts 'enter product price='
      price = gets.chomp
      puts 'enter product stock item='
      stock = gets.chomp
      puts 'enter product company name='
      company = gets.chomp
      contents = file_append(id, name, price, stock, company)
      id += 1
      no -= 1
    end
  end

  def remove_products
    contents = file_open
    puts contents
    puts 'enter product id'
    product_id = gets.chomp
    new_contents = contents.gsub(/#{product_id}\s\w+\s\w+\s\w+\s\w+\s/m, '')
    file_write(new_contents)
  end

  def edit_product
    contents = file_open
    puts 'enter product id to be changed'
    product_id = gets.chomp
    puts 'enter product name'
    name = gets.chomp
    puts 'enter product price'
    price = gets.chomp
    puts 'enter product stock item'
    stock = gets.chomp
    puts 'enter product company'
    company = gets.chomp
    new_contents = contents.gsub(/#{product_id}\s\w+\s\w+\s\w+\s\w+/m, "#{product_id} #{name} #{price} #{stock} #{company}")
    file_write(new_contents)
  end
end

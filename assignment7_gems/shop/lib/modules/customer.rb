require 'modules/file_handling'

include FileHandling
# customer module
module Customer
  def buy_products
    puts 'enter product id'
    product_id = gets.chomp
    puts 'enter credit card number'
    card_no = gets.chomp
    puts 'enter product cvv'
    cvv = gets.chomp
    file_odrders_append(product_id, card_no, cvv)
    contents = file_open
    puts contents
    update_contents = Array.new
    contents.scan(/(#{product_id})\s+(\w+)\s+(\d+)\s+(\d+)\s+(\w+)\s*/)
    quantity = $4
    quantity = quantity.to_i - 1
    updated_quantity = contents.gsub(/(#{product_id})\s+(\w+)\s+(\d+)\s+(\d+)\s+(\w+)/, "#{product_id} #{$2} #{$3} #{quantity} #{$5}")
    file_write(updated_quantity)
  end
end

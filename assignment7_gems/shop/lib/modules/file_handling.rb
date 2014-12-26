# file handling
module FileHandling
  def file_open
    File.open('inventory.txt', 'r').read
  end

  def last_Record
    File.open('inventory.txt', 'r') { |file| file.extend(Enumerable).inject { |_, ln| ln } }
  end

  def file_write(new_contents)
     File.open('inventory.txt', 'w') { |file| file.puts new_contents }
  end

  def file_append(id, name, price, stock, company)
    File.open('inventory.txt', 'a') { |file| file.puts "#{id} #{name} #{price} #{stock} #{company}" }
  end

  def file_odrders_append(product_id, card_no, cvv)
    File.open('orders.txt', 'a') { |file| file.puts "#{product_id} #{card_no} #{cvv}" }
  end
end

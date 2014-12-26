# file handling
module FileHandling
  def file_open
    File.open('databases/inventory.txt', 'r') { |file| contents = file.read }
  end

  def last_Record
    File.open('databases/inventory.txt', 'r') { |f| f.extend(Enumerable).inject { |_, ln| ln } }
  end

  def file_write(new_contents)
     File.open('databases/inventory.txt', 'w') { |file| file.puts new_contents }
  end

  def file_append(id, name, price, stock, company)
    File.open('databases/inventory.txt', 'a') { |file| file.puts "#{id} #{name} #{price} #{stock} #{company}" }
  end

  def file_odrders_append(product_id, card_no, cvv)
    File.open('databases/orders.txt', 'a') { |file| file.puts "#{product_id} #{card_no} #{cvv}" }
  end

end
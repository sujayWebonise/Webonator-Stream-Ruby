require 'csv'
class Main
  def process_csv
    puts 'Enter file name='
    file_name = gets.chomp
    file_name_regex = file_name.scan(/(\w+)(s.csv)/)
    name = $1
    name = name.capitalize
    puts new_class = Object.const_set(name,Class.new)
    new_class.new
    csv=CSV.new (file_name)
    CSV.foreach(file_name,:headers => true,:converters => :all,:header_converters => :symbol) do |row|
        row.to_hash
        csv_object = new_class.new
        row.each do |instance_variable,values|
          new_class.class_eval do
          attr_accessor instance_variable
        end
        csv_object.instance_variable_set("@#{instance_variable}", values)
    end
      puts csv_object.inspect
  end
end
end
m=Main.new
m.process_csv
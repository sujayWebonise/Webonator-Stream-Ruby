#!usr/bin/env ruby
require 'csv'
class FileOperation
  def fileread
  	file_html = File.open("states.html","r") {|file| contents = file.read}
  	   text,match_line1,heading=Array.new
  	   heading = file_html.scan(/(?:<tr><th>)(\w+)(?:<\/th><th>)(\w+)(?:<\/th><th>)(\w+\s\w+)(?:<\/th><\/tr>)/)
  	   match_line1=file_html.scan(/(?:<tr><td>|<tr>)([td>]+[\w\s\w]+|[\/[^*!<>@%\^]+\/]+)(?:<\/td><td>)(\w+)(?:[<\/td><td>]*)(\d+)(?:<\/td><\/tr>)/)
	   
       CSV.open("regex.csv", "w") do |csv|
	   	heading.each do |line|
	    	csv << line.flatten
	    end
	    match_line1.each do |line|
	    	csv << line.flatten
	    end
		
 	   end
  end
end
file_read=FileOperation.new
file_read.fileread
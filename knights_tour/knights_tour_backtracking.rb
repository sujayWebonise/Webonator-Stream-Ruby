#knights tour algorithm
class Knights_tour
	def is_valid(x,y,chessboard)
			if x >= 0 && x < $size.to_i && y < $size.to_i && y >= 0 && chessboard[x][y] == -1 then
					return true
			end
		return false
	end
	
	def print_tour(chessboard)
		chessboard.each do |r|
			puts r.map { |p| p }.join("\t")
		end
	
	
	end
	def knights_tour
		puts "enter board size"
  		$size=gets.chomp
		$chessboard= Array.new($size.to_i) {Array.new($size.to_i,-1)}
		#puts $chessboard
		move_x=[2 , 1 ,-1,-2 ,-2,-1, 1, 2]
		move_y=[1 , 2 , 2, 1 ,-1,-2,-2,-1]
		
		$chessboard[2][2]=0
		
		if backtracking(2,2,1,$chessboard,move_x,move_y) == false then
			puts "solution does not exist"
			return false
		else
			print_tour($chessboard)
		end
		return true
	end
	def backtracking(x,y,move_index,chessboard,move_x,move_y)

		if move_index == ($size.to_i * $size.to_i ) then
			puts "suceessfull  move index =  #{move_index}"
			return true
		end
		#puts move_index
		i=0
		while i < 8 do
			next_x = x + move_x[i]
			next_y = y + move_y[i]
			#puts "travel   = #{next_x},#{next_y} #{move_index}"
			if is_valid(next_x,next_y,$chessboard) then
				
				$chessboard[next_x][next_y]=move_index
					#puts "#{next_x},#{next_y} #{move_index}"
				if backtracking(next_x,next_y,move_index+1,chessboard,move_x,move_y)==true then
					return true
				else
					$chessboard[next_x][next_y]= -1
				end
				
			end
		i=i+1
		end
		return false
	end
end

k=Knights_tour.new
k.knights_tour
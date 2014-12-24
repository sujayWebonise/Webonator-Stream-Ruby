# knights tour algorithm
  def valid?(x, y, chessboard)
    return true if x >= 0 && x < @size.to_i \
    && y < @size.to_i && y >= 0 && chessboard[x][y] == -1
  end

  def print_tour(chessboard)
    chessboard.each do |r|
      puts r.map { |p| p }.join("\t")
    end
  end

  def knights_solution
    puts 'Enter board size'
    @size = gets.chomp
    puts 'Enter x y coordinates'
    initial_x = gets.chomp
    initial_y = gets.chomp
    move_xy = [[2, 1], [1, 2], [-1, 2], [-2, 1],
               [-2, -1], [-1, -2], [1, -2], [2, -1]]
    @chessboard = Array.new(@size.to_i) { Array.new(@size.to_i, -1) }
    @chessboard[initial_x.to_i][initial_x.to_i] = 0
    if next_move(initial_x.to_i, initial_y.to_i, 1, @chessboard, move_xy) == false
      puts 'solution does not exist'
      return false
    else
      print_tour(@chessboard)
    end
  end

  def next_move(x, y, move_index, chessboard, move_xy)
    if move_index == (@size.to_i * @size.to_i)
      puts "suceessfull  move index =  #{move_index}"
      return true
    end
    i = 0
    while i < 8
      coordinates = move_xy[i]
      next_x = x + coordinates[0]
      next_y = y + coordinates[1]
      if valid?(next_x, next_y, @chessboard)
        @chessboard[next_x][next_y] = move_index
        if next_move(next_x, next_y, move_index + 1, chessboard, move_xy) == true
          return true
        else
          @chessboard[next_x][next_y] = -1
        end
      end
      i += 1
    end
  end
  knights_solution

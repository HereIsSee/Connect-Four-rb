class ConnectFour
  def initialize
    @array = Array.new(7) { Array.new(6) }
  end

  def play
    player_number = 1
    until win? || board_full?
      puts "Player #{player_number} make your move (choose column between 1 to 7):"
      show_grid

      column = ''
      loop do
        column = gets.chomp
        break unless !column.to_i.between?(1, 7) || column_full?(column.to_i - 1)

        puts 'Wrong input!'
      end

      move('x', column.to_i - 1) if player_number == 1
      move('o', column.to_i - 1) if player_number == 2

      return puts "Player #{player_number} wins!" if win?

      player_number = player_number == 1 ? 2 : 1
    end
    puts 'Tie!'
  end

  def board_full?
    @array.each do |column|
      return false if column.compact.size < 6
    end
    true
  end

  def win?
    return true if horizontal_win?
    return true if vertical_win?
    return true if diagonal_win?

    false
  end

  def vertical_win?
    @array.each do |column|
      next if column.compact.size < 4

      column.each_cons(4) do |segment|
        return true if segment.all? { |value| value == segment[0] && !value.nil? }
      end
    end
    false
  end

  def horizontal_win?
    transposed_array = @array.transpose

    transposed_array.each do |row|
      row.each_cons(4) do |segment|
        return true if segment.all? { |value| value == segment[0] && !value.nil? }
      end
    end
    false
  end

  def diagonal_win?
    (0..3).each do |col|
      (0..2).each do |row|
        if @array[col][row] &&
           @array[col][row] == @array[col + 1][row + 1] &&
           @array[col][row] == @array[col + 2][row + 2] &&
           @array[col][row] == @array[col + 3][row + 3]
          return true
        end
      end
    end

    (0..3).each do |col|
      (3..5).each do |row|
        if @array[col][row] &&
           @array[col][row] == @array[col + 1][row - 1] &&
           @array[col][row] == @array[col + 2][row - 2] &&
           @array[col][row] == @array[col + 3][row - 3]
          return true
        end
      end
    end

    false
  end

  def move(sign, column)
    row = @array[column].index(nil)
    @array[column][row] = sign
    @array[column]
  end

  def column_full?(column)
    return true if @array[column].compact.size >= 6

    false
  end

  def show_grid
    # Iterate from top row (index 5) to bottom row (index 0)
    5.downto(0) do |row_index|
      row = ''
      # Iterate over each column (from 0 to 6) to get the value in the current row
      0.upto(6) do |col_index|
        value = @array[col_index][row_index] || '-'
        row = row.concat(value, ' ')
      end
      puts row
    end
    puts ''
  end
end

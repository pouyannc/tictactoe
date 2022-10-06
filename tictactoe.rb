class TicTacToe
  attr_accessor :board, :p1, :p2, :current_player, :p1_symbol, :p2_symbol, :current_symbol, :position_hash
  @@winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]

  def initialize (p1, p2)
    @board = " 1 | 2 | 3 \n---+---+---\n 4 | 5 | 6 \n---+---+---\n 7 | 8 | 9 \n"
    @p1 = p1
    @p2 = p2
    @current_player = p1
    @p1_symbol = "x"
    @p2_symbol = "o"
    @current_symbol = p1_symbol
    @position_hash = {p1_symbol => [], p2_symbol => []}
  end
  
  def update_board (position, symbol)
    board.sub!(position, symbol)
    if current_player == p1
      position_hash[p1_symbol].push(position.to_i)
      @current_player = p2
      @current_symbol = p2_symbol
    else 
      position_hash[p2_symbol].push(position.to_i)
      @current_player = p1
      @current_symbol = p1_symbol
    end 
  end

  def win?
    @@winning_lines.each do |line|
      return true if line - position_hash[current_symbol] == [] 
    end
  end

end

# 1,2,3  4,5,6  7,8,9  1,4,7  2,5,8  3,6,9  1,5,9  3,5,7
# if position_hash[current_symbol].length >= 3
#   check if a line exists


puts "Let's play Tic-Tac-Toe!"
puts "Player 1: x"
puts "Player 2: o"
puts "Start? [y/n]"
start_ans = gets.chomp
if (start_ans.downcase == "y")
  puts "Player 1, enter your name: "
  p1 = gets.chomp
  puts "Player 2, enter your name: "
  p2 = gets.chomp
  game = TicTacToe.new(p1, p2)
  puts game.board

  for i in 0..8
    puts "#{game.current_player}, select a position (number)"
    position = gets.chomp.to_s
    game.update_board(position,game.current_symbol)
    puts game.board
    if game.position_hash.any? { |key,array| array.length >= 3 }
      break if game.win?
    end
  end
end

class TicTacToe
  attr_accessor :board, :p1, :p2, :current_player, :p1_symbol, :p2_symbol, :current_symbol

  def initialize (p1, p2)
    @board = " 1 | 2 | 3 \n---+---+---\n 4 | 5 | 6 \n---+---+---\n 7 | 8 | 9 \n"
    @p1 = p1
    @p2 = p2
    @current_player = p1
    @p1_symbol = "X"
    @p2_symbol = "O"
    @current_symbol = p1_symbol
  end
  
  def update_board (position, symbol)
    board.sub!(position, symbol)
    if current_player == p1
      current_player = p2
      current_symbol = p2_symbol
    else 
      current_player = p1
      current_symbol = p1_symbol
    end 
  end

end

puts "Let's play Tic-Tac-Toe!"
puts "Player 1: X"
puts "Player 2: O"
puts "Start? [y/n]"
start_ans = gets.chomp
if (start_ans.downcase == "y")
  puts "Player 1, enter your name: "
  p1 = gets.chomp
  puts "Player 2, enter your name: "
  p2 = gets.chomp
  game = TicTacToe.new(p1, p2)
  puts game.board

  puts "#{game.current_player}, select a position (number)"
  position = gets.chomp.to_s
  game.update_board(position,game.current_symbol)
  puts game.board
end

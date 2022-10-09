class TicTacToe
  attr_accessor :board, :p1, :p2, :current_player, :p1_symbol, :p2_symbol, :current_symbol, :position_hash, :winner
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
    @winner = false
  end
  
  def update_board (position)
    board.sub!(position, current_symbol)
    @position_hash[@current_symbol].push(position.to_i)
    return @winner = true if @position_hash[@current_symbol].length >=3 && self.win? 
    if @current_player == p1
      @current_player = p2
      @current_symbol = p2_symbol
    else 
      @current_player = p1
      @current_symbol = p1_symbol
    end 
  end

  def win?
    @@winning_lines.each do |line|
        return true if line - @position_hash[@current_symbol] == []
    end
    return false
  end

  def self.intro_screen
    puts "Let's play Tic-Tac-Toe!"
    puts "Player 1: x"
    puts "Player 2: o"
    puts "Start? [y/n]"
  end

  def winner_screen
    puts "#{self.current_player} is the winner!"
  end

  def tie_screen
    puts "It's a tie."
  end
end

TicTacToe.intro_screen
start_ans = gets.chomp

if start_ans.downcase == "y"
  puts "Player 1, enter your name: "
  p1 = gets.chomp
  puts "Player 2, enter your name: "
  p2 = gets.chomp

  while start_ans.downcase == "y"
    game = TicTacToe.new(p1, p2)
    puts game.board

    for i in 0..8
      puts "#{game.current_player}, select a position (number)"
      position = gets.chomp.to_s
      game.update_board(position)
      puts game.board
      break if game.winner
    end

    game.winner ? game.winner_screen : game.tie_screen
    puts "Play again? [y/n]"
    start_ans = gets.chomp
  end
end


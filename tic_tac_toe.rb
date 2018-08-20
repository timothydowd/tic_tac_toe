
class Game

  WIN_COMBOS = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

  def player1 # getter
    @player1
  end
  def player2 # getter
    @player2
  end
  def board
    @board
  end

  def win_combos
    WIN_COMBOS
  end


  #-----------------------------------------------------------

  def initialize
    self.create_players
    self.game_start

  end

  def create_players # creates players, takes names and sets O or X
    @player1 = Player.new
    @player2 = Player.new

    puts "Player 1, please enter your name:"
    @player1.name = gets.chomp
    @player1.piece = "O"
    puts "\n"

    puts "Player 2, please enter your name:"
    @player2.name = gets.chomp
    @player2.piece = "X"
    puts "\n"

  end

  def show_board #shows board

    puts board.board_array[0..2].join(" ")
    puts board.board_array[3..5].join(" ")
    puts board.board_array[6..8].join(" ")
    puts "\n"
  end


  def game_start # creates board and chooses first player to start
    @board = Board.new
    @player1.turn = true #remember to delete this code
    #rand <= 0.5 ? @player1.turn = true : @player2.turn = true
    self.take_turn
  end


  def take_turn # records player cell choice
    self.show_board

    if @player1.turn
      puts "#{@player1.name}, choose a square:"
      player1.current_choice = gets.chomp.to_i
      player1.chosen_cells << player1.current_choice
      self.place_piece
    else
      puts "#{@player2.name}, choose a square:"
      player2.current_choice = gets.chomp.to_i
      player2.chosen_cells << player1.current_choice
      self.place_piece
    end
    puts "\n"

    self.check_combos
  end


  def place_piece # updates board after player chooses cell
    if @player1.turn
      board.board_array.map! do |cell|
        cell == player1.current_choice ? cell = player1.piece : cell
      end
    else
      board.board_array.map! do |cell|
        cell == player2.current_choice ? cell = player2.piece : cell
      end
    end
  end

  def check_combos # checks to see if we have a winning combination
    puts "in check_combos"
    puts "player 1 chosen cells = #{player1.chosen_cells}"
    self.win_combos.each do |combo|
      combo.each do |cell|
        if player1.chosen_cells.any? { |chosen| chosen == cell}
          
          puts "match #{combo} #{cell}"
          puts "\n"
        else
          puts "no match"
        end
      end
    end

  end



end

#-----------game class end -----------------------------


class Player

  attr_accessor :name, :piece, :turn, :chosen_cells, :current_choice

  def initialize
    @starter = false
    @chosen_cells = []

  end

end


class Board

  def initialize
    @board_array = [1,2,3,4,5,6,7,8,9]
  end

  def board_array
    @board_array
  end

end


class Cell

  def initialize
  end

end




game = Game.new

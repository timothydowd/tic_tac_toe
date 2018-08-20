
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
    rand <= 0.5 ? self.take_turn(player1) : self.take_turn(player2)
  end


  def take_turn(current_player) # records player cell choice after checking if board is full
    self.show_board
    return puts "Game is a draw" if board.board_array.all? {|cell| cell.is_a?(String)}
    puts "#{current_player.name}, pick a square"
    current_player.current_choice = gets.chomp.to_i
    while board.board_array.all?{|cell| cell != current_player.current_choice}
      puts "#{current_player.name}, you must pick an unused cell"
      current_player.current_choice = gets.chomp.to_i
    end


    current_player.chosen_cells << current_player.current_choice

    self.place_piece(current_player)
    puts "\n"
    self.check_combos(current_player)
  end


  def place_piece(current_player) # updates board after player chooses cell
      board.board_array.map! do |cell|
        cell == current_player.current_choice ? cell = current_player.piece : cell
      end
  end

  def check_combos(current_player) # checks to see if we have a winning combination
    self.win_combos.each do |combo|
      match_count = 0
      combo.each do |combo_cell|
        if current_player.chosen_cells.any? { |chosen| chosen == combo_cell}
          match_count += 1
          return puts "#{current_player.name} is the winner!", self.show_board if match_count == 3
        else
          match_count
        end
      end
    end

    current_player == player1 ? current_player = player2 : current_player = player1
    take_turn(current_player)

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

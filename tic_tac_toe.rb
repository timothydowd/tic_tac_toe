
class Game

  def player1 # getter
    @player1
  end

  def player2 # getter
    @player2
  end

  def initialize
    @player1 = Player.new
    @player2 = Player.new
  end

  def create_players


  end

  def game_start # chooses first player to start and constructs board
    #rand <= 0.5 ? @player1.first_move = true : @player2.first_move = true

    puts "Name, choose a square"
    puts "\n"
    board = Board.new
  end

  def first_move

  end

  def last_move
  end





end




class Board

  def initialize
    @board_array = [[1,2,3],[4,5,6],[7,8,9]]
    puts @board_array[0].join(" ")
    puts @board_array[1].join(" ")
    puts @board_array[2].join(" ")

  end

end



class Cell

  def initialize
  end

end



class Player

  def initialize
    if defined?(@@number_of_players) #assigns piece symbol
      puts "Player 2, please enter your name:"
      @name = gets.chomp # assigns player name
      @piece = "X"

      puts "\n"
    else
      puts "Player 1, please enter your name:"
      @piece = "O"
      @name = gets.chomp # assigns player name

      @@number_of_players = 1
      puts "\n"
    end
  end

  def name #getter
    @name
  end

  def piece #getter
    @piece
  end




  def move

  end


end



game = Game.new
game.game_start
puts game.player2.name

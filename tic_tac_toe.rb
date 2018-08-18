
class Game

  def player1 # getter
    @@player1
  end

  def player2 # getter
    @@player2
  end

  def initialize
    @@player1 = Player.new
    @@player2 = Player.new
    board = Board.new
    puts @@player1.piece
    puts @@player2.piece
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

class Player < Game

  def initialize
    puts "Player, please enter your name"
    @name = gets.chomp
    @@player1 == nil ? @piece = "O" : @piece = "X" # assigns naught or cross

  end

  def name #getter
    @name
  end

  def piece #getter
    @piece
  end


end



Game.new

class Game

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],

  [0,4,8],
  [2,4,6],
  [1,4,7],

  [0,3,6],
  [2,5,8],
  ]

  def current_player
     @board.turn_count.even? ? player_1 : player_2
  end


def won?
    WIN_COMBINATIONS.find do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] && @board.cells[combo[0]] != " "
  end
end


  def draw?
    board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      @board.cells[won?[0]]
    else
      nil
    end
  end

  def turn
    puts "Please enter a number 1-9:"
    user_input = current_player.move(@board)
    if @board.valid_move?(user_input)
      @board.update(user_input, current_player)
      else
        puts "Please enter a number 1-9:"
        turn
      end

    end

    def play
      turn until over?
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end

end

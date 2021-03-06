class Board

attr_accessor :cells

def initialize
  reset!
end

def reset!
  @cells = Array.new(9, " ")
end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    @cells[input.to_i - 1]
  end

   def update(input, player)
       index = input.to_i - 1
       @cells[index] = player.token
  end

  def full?
    if !@cells.any?(" ")
      true
    else
      false
    end
  end

  def valid_move?(input)
   if !taken?(input) && input.to_i.between?(1,9)
     true
   else
     false
   end
  end

 def turn_count
    @cells.count{|square| square != " " }
  end

  def taken?(input)
   index = position(input)
   if index.include?("X") || index.include?("O")
     true
   else
     false
   end
   end

end

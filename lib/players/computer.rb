module Players
class Computer < Player

  def move(board)
    board.cells.each_with_index{|e, index|
      if e == " "
        return "#{index + 1}"
      end
     }
  end

end
end

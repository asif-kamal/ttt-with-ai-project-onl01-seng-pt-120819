module Players
class Human < Player

  def move(input)
    puts "Please enter your move."
    input = gets
  end
end
end

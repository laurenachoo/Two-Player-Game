
require 'colorize'
#Player info
class Player
  attr_accessor(:name, :lives, :correct_answers)

  def initialize(name, player_lives = 3)
    @name = name
    @lives = player_lives 
    @correct_answers = 0
  end

  def gain_point
    @correct_answers += 1
  end

  def lose_life
    @lives -= 1
  end
end 
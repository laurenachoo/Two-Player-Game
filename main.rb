
require 'colorize'
require_relative 'player_info'
require_relative 'questions'


@loop = true

@turn = 0



print 'Enter Player 1s name : '
@username = gets.chomp
p1 = Player.new(@username)
p1.name = p1.name.colorize(:magenta)
print 'Enter Player 2s name : '
@username = gets.chomp
p2 = Player.new(@username)
p2.name = p2.name.colorize(:magenta)

puts
puts "Let's start the game!"
puts

while @loop
  
  question = Question.new

  case @turn
  when 0
    print "#{p1.name}: "
  else 
    print "#{p2.name}: "
  end

  print question.to_string
  @user_input = gets.chomp.to_i

  if @turn == 0 && question.is_correct?(@user_input)
    puts "Correct! Good job!".colorize(:blue)
    p1.gain_point
    @turn += 1
  elsif @turn == 0 && !question.is_correct?(@user_input)
    puts "Sorry that's wrong :(!".colorize(:red)
    p1.lose_life
    @turn += 1
  elsif @turn == 1 && question.is_correct?(@user_input)
    puts "Correct! Good job!".colorize(:blue)
    p2.gain_point
    @turn -= 1
  elsif @turn == 1 && !question.is_correct?(@user_input)
    puts "Sorry that's wrong :(!".colorize(:red)
    p2.lose_life
    @turn -= 1
  end

  puts
  puts "The current score is:
        #{p1.name} has #{p1.correct_answers} correct answers and #{p1.lives} lives left 
        #{p2.name} has #{p2.correct_answers} correct answers and#{p2.lives} lives left"
  puts

  if p1.lives < 1 || p2.lives <1
    puts "GAME OVER!"
    if p1.lives < 1
      puts "The winner is #{p2.name}"
    elsif p2.lives < 1
      puts "The winner is #{p1.name}"
    end

    puts "The final score was:
        #{p1.name} has #{p1.correct_answers} correct answers and #{p1.lives} lives left 
        #{p2.name} has #{p2.correct_answers} correct answers and#{p2.lives} lives left"

    @loop = false
  end

end
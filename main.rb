#require_relative 'player_info'
#require_relative 'questions'

def game
player1_lives = 3
player2_lives = 3


player1_turn = true
  while player1_lives >0 && player2_lives >0
  @first_num = rand(1..20)
  @second_num = rand(1..20)
  @answer = @first_num + @second_num 

    if player1_turn
      puts "Player 1, what is #{@first_num} + #{@second_num}?"
    else  
      puts "Player 2, what is #{@first_num} + #{@second_num}?"
    end

  puts "Enter your answer: "
  @user_answer = gets.chomp.to_i

      if @answer == @user_answer
        puts "Correct!"
      else 
          if player1_lives -= 1
            else player2_lives -= 1  
          end  
        puts "Wrong! :("
        puts "Player 1 has #{player1_lives} lives." 
        puts "Player 2 has #{player2_lives} lives."
      end
  end 
end
game
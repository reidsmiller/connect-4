require_relative 'playable'

class GamePlay
include Playable

  def initialize
    @player1_name = nil
    @player2_name = nil
    @game = Game.new
    @player_turns = [] 
    @player2_turns = []
    @comp_turns = [] 
    @player_wins = 0 
    @player2_wins = 0
    @comp_wins = 0 
    @draws = 0 
  end

  def player1_turn
    column = gets.chomp
      if @game.board.place(column, 'X')
        @player_turns << column
        @game.win?
      else
        puts 'That is not a valid selection, please select a new column'
        player1_turn
      end
  end

  def player2_turn
    column = gets.chomp
      if @game.board.place(column, 'O')
        @player2_turns << column
        @game.win?
      else
        puts 'That is not a valid selection, please select a new column'
        player2_turn
      end
  end
  
  def computer_turn
    comp_column = (65 + rand(7)).chr
    if @game.board.place(comp_column, 'O')
    @comp_turns << comp_column
    @game.win?
    comp_column
    else 
      computer_turn
    end
  end

  def game_menu
    clear_terminal
    puts logo
    puts
    puts 'Enter p to play the highest stakes game of your life with a computer. Enter 2 to play with two players. Enter q to wimp out and quit.'
    ans = gets.chomp
    decide_the_path(ans)
  end

  def turn_round_two_players
    clear_terminal
    if @player1_name == nil
      obtain_player_names
      clear_terminal
    end
    two_player_turns(@player1_name, @player2_name, @player_turns, @player2_turns)
    game_end_two_player
  end

  def turn_round
    loop do
      clear_terminal
      show_last_moves('You', 'computer', @player_turns, @comp_turns)
      render_board_with_lines
      column_choice("intrepid player")
      player1_turn
      break if game_over?
      computer_turn
      break if game_over?
    end
    game_end
  end

  def game_end
    if @game.game_win == true
      clear_terminal
      @player_wins += 1
      puts 'YOU WON! HOW COOL!'
    elsif @game.game_win == false
      clear_terminal
      @comp_wins += 1
      puts "YOU LOST! You're not smart enough to beat a computer choosing random columns? Sad day."
    elsif @game.game_draw == true
      clear_terminal
      @draws += 1
      puts "That was a draw. BOOOOOOOORRRRRRIIIIIINGGGGGGGG. You're literally not smart enough to beat a computer choosing random columns."
    end
    puts "================================\n\nYou've won #{@player_wins} times\n\nThe computer has won #{@comp_wins} times\n\nYou've had #{@draws} draw matches\n\n================================\n\nPress ENTER to continue"
    gets.chomp
    game_menu
  end

  def game_end_two_player
    if @game.game_win == true
      clear_terminal
      @player_wins += 1
      puts "#{@player1_name.capitalize} WON! HOW COOL!"
    elsif @game.game_win == false
      clear_terminal
      @player2_wins += 1
      puts "#{@player2_name.capitalize} WON! HOW COOL!"
    elsif @game.game_draw == true
      clear_terminal
      @draws += 1
      puts "That was a draw. BOOOOOOOORRRRRRIIIIIINGGGGGGGG."
    end
    puts "================================\n\n#{@player1_name.capitalize} won #{@player_wins} times\n\n#{@player2_name.capitalize} won #{@player2_wins} times\n\nYou've had #{@draws} draw matches\n\n================================\n\nPress ENTER to continue"
    gets.chomp
    game_menu
  end
end
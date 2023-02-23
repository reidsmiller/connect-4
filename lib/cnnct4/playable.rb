module Playable

  def logo
    '
==============================================================
_________                                     __       _____  
\_   ___ \  ____   ____   ____   ____   _____/  |_    /  |  | 
/    \  \/ /  _ \ /    \ /    \_/ __ \_/ ___\   __\  /   |  |_
\     \___(  <_> )   |  \   |  \  ___/\  \___|  |   /    ^   /
 \______  /\____/|___|  /___|  /\___  >\___  >__|   \____   | 
        \/            \/     \/     \/     \/            |__| 
=============================================================='
  end

  def game_over_logo
    '
       ________    _____      _____  ___________ ____________   _________________________ 
      /  _____/   /  _  \    /     \ \_   _____/ \_____  \   \ /   /\_   _____/\______   \
     /   \  ___  /  /_\  \  /  \ /  \ |    __)_   /   |   \   Y   /  |    __)_  |       _/
     \    \_\  \/    |    \/    Y    \|        \ /    |    \     /   |        \ |    |   \
      \______  /\____|__  /\____|__  /_______  / \_______  /\___/   /_______  / |____|_  /
             \/         \/         \/        \/          \/                 \/         \/ '
  end
   
  def reset_turns
    @game.board.reset
    @game.game_win = nil
    @game.game_draw = false
    @player_turns = [] 
    @player2_turns = []
    @comp_turns = []
  end

  def invalid_selection_message
    puts 'That is not a valid selection, please select a new column'
  end

  def clear_terminal
    puts `clear`
  end

  def decide_the_path(user_input)
    if user_input == "p"
      reset_turns
      turn_round
    elsif user_input == '2'
      reset_turns
      turn_round_two_players
    elsif user_input == "q"
      clear_terminal
      puts game_over_logo
      puts "\n\n"
    else
      clear_terminal
      puts "#{user_input} isn't a valid answer fool!!"
      game_menu 
    end
  end

  def obtain_player_names
    puts 'Player 1 enter your name, your token is a X'
    @player1_name = gets.chomp 
    puts 'Player 2 enter your name, your token is an O'
    @player2_name = gets.chomp
  end

  def render_board_with_lines
    puts "\n\n==============="
    @game.board.render
    puts "===============\n\n"
  end

  def column_choice(player)
      puts "What column do you choose, #{player.capitalize}?"
  end

  def game_over?
    @game.game_win != nil || @game.game_draw
  end

  def show_last_moves(p1_name, p2_name, p1_turns, p2_turns)
    puts "#{p1_name.capitalize} chose #{p1_turns.last} and #{p2_name.capitalize} chose #{p2_turns.last}" if p1_turns != []
  end

  def two_player_turns(p1_name, p2_name, p1_turns, p2_turns)
    loop do
      show_last_moves(p1_name, p2_name, p1_turns, p2_turns)
      render_board_with_lines
      column_choice(p1_name)
      player1_turn
      break if game_over?
      clear_terminal
      render_board_with_lines
      column_choice(p2_name)
      player2_turn
      break if game_over?
      clear_terminal
    end
  end

  def player_v_comp_turns(p1_name, p2_name, p1_turns, p2_turns)
    loop do
      clear_terminal
      show_last_moves(p1_name, p2_name, p1_turns, p2_turns)
      render_board_with_lines
      column_choice("intrepid player")
      player1_turn
      break if game_over?
      computer_turn
      break if game_over?
    end
  end
end
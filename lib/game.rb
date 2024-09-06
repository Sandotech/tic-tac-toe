# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

# Tic Tac Toe class game
class Game
  def initialize
    @player_one = init_player_one
    @player_two = init_player_two
    @board = Board.new
    play
  end

  private

  def player_turn(number, player_character)
    row = get_row_input(number)
    column = get_column_input(row)
    @board.place_character(player_character, row, column)
  end

  def get_row_input(number)
    puts "Your turn, Player ##{number}\nPlease enter the row where you want to put your character"
    row = gets.chomp.to_i
    @board.find_valid_row(row)
  end

  def init_player_one
    puts 'Welcome, please enter your character, player 1'
    Player.new(gets.chomp)
  end

  def init_player_two
    puts 'Great! your turn, Player 2!'
    Player.new(gets.chomp)
  end

  def play
    puts 'Welcome to Tic Tac Toe Game!'
    game_loop
  end

  def get_column_input(row)
    puts 'now put the column in the selected row'
    @board.find_valid_column(row, gets.chomp.to_i)
  end

  def announce_winner(player_number)
    puts "Congratulations Player ##{player_number}, you've won the TIC TAC TOE GAME!"
  end

  def player_loop(player_number, character)
    @board.display
    player_turn(player_number, character)
  end

  def if_player_won(player_character, player_number)
    return unless @board.check_won?(player_character)

    announce_winner(player_number)
    coincidences = @board.coincidences(player_character)
    @board.display_with_color(coincidences, :green)
    true
  end

  def draw?(player_character)
    draw_condition = @board.check_full? unless @board.check_won?(player_character)

    return unless draw_condition

    puts "It's a draw!"
    @board.display_with_color((0..8).to_a, :red)
    true
  end

  def game_loop_breaker(player_character, player_number)
    true if draw?(player_character) || if_player_won(player_character, player_number)
  end

  def game_loop
    until @board.check_full?
      player_loop(1, @player_one.character)
      break if game_loop_breaker(@player_one.character, 1)

      player_loop(2, @player_two.character)
      break if game_loop_breaker(@player_two.character, 2)
    end
  end
end

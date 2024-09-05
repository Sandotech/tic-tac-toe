# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

class Game
  def initialize
    @player_one = self.init_player_one
    @player_two = self.init_player_two
    @board = Board.new
    self.play
  end

  private

  def player_turn(number, player_character)
    row = self.set_row(number)
    column = self.set_column(row)
    @board.set_word(player_character, row, column)
  end

  def set_row(number)
    puts "Your turn, Player ##{number}\nPlease enter the row where you want to put your character"
    row = gets.chomp.to_i
    return @board.set_row(row)
  end

  def init_player_one
    puts 'Welcome, please enter your character, player 1'
    Player.new(gets.chomp)
  end

  def init_player_two
    puts "Great! your turn, Player 2!"
    Player.new(gets.chomp)
  end

  def play
    puts "Welcome to Tic Tac Toe Game!"
    self.game_loop
  end

  def set_column(row)
    puts "now put the column in the selected row"
    @board.set_column(row, gets.chomp.to_i)
  end

  def announce_winner(player_number)
    puts "Congratulations Player ##{player_number}, you've won the TIC TAC TOE GAME!"
  end

  def player_loop(player_number, character)
    @board.display
    player_turn(player_number, character)
  end

  def if_player_won(player_character, player_number)
    if @board.check_won?(player_character)
      announce_winner(player_number)
      coincidences = @board.coincidences(player_character)
      @board.display_with_color(coincidences, :green)
      true
    end
  end

  def draw?(player_character)
    draw_condition = @board.check_full? unless @board.check_won?(player_character)

    if draw_condition
      puts "It's a draw!"
      @board.display_with_color((0..8).to_a, :red)
      true
    end
  end

  def game_loop_breaker(player_character, player_number)
    true if self.draw?(player_character) or if_player_won(player_character, player_number)
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

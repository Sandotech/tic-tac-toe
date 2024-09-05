# frozen_string_literal: true

require_relative 'player'
require_relative 'table'

class Game
  turns = 9

  def initialize
    puts 'Welcome, please enter your character, player 1'
    @player_one = Player.new(gets.chomp)
    puts "Great! your turn, Player 2!"
    @player_two = Player.new(gets.chomp)
    puts "Welcome to Tic Tac Toe Game!"
    @board = Board.new
    self.game_loop
  end

  def player_turn(number, player)
    row = self.set_row(number)
    column = self.set_column(row)
    @board.set_word(player.character, row, column)
  end

  def set_row(number)
    puts "Your turn, Player ##{number}\nPlease enter the row where you want to put your character"
    row = gets.chomp.to_i
    return @board.set_row(row)
  end

  def set_column(row)
    puts "now put the column in the selected row"
    @board.set_column(row, gets.chomp.to_i)
  end

  def announce_winner(player_number)
    puts "Congratulations Player ##{player_number}, you've won the TIC TAC TOE GAME!"
  end

  def game_loop
    until @board.check_full?
      @board.display
      player_turn(1, @player_one)
      break if @board.check_full?
      if @board.check_won?(@player_one.character)
        announce_winner(1)
        coincidences = @board.coincidences(@player_one.character)
        @board.display_with_color(coincidences, :green)
        break
      end
      @board.display
      player_turn(2, @player_two)
      break if @board.check_full?
      if @board.check_won?(@player_two.character)
        announce_winner(2)
        coincidences = @board.coincidences(@player_two.character)
        @board.display_with_color(coincidences, :green)
        break
      end
    end
  end
end
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
    column = self.set_column
    @board.set_word(player.character, row, column)
  end

  def set_row(number)
    puts "Your turn, Player ##{number}\nPlease enter the row where you want to put your character"
    row = gets.chomp.to_i 
    until row <= 2
      puts "Please enter the row where you want to put your character, the value should be between 0 and 2"
      row = gets.chomp.to_i 
    end
    row
  end

  def set_column
    puts "now put the column in the selected row"
    column = gets.chomp.to_i
    until column <= 2
      puts "Put the column in the selected row, the value should be between 0 and 2"
      column = gets.chomp.to_i 
    end
    column
  end

  def game_loop
    until @board.check_full? 
      @board.display
      player_turn(1, @player_one)
      @board.display
      player_turn(2, @player_two)
    end

    @board.display
  end
end
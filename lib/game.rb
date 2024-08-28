# frozen_string_literal: true

require_relative 'player'
require_relative 'table'

class Game
  def initialize
    puts 'Welcome, please enter your character, player 1'
    @player_one = Player.new(gets.chomp)
    puts "Great! your turn, Player 2!"
    @player_two = Player.new(gets.chomp)
  end
end
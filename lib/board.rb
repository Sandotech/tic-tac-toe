# frozen_string_literal: false

require 'colorize'

# Board table 3X3 of the Tic Tac Toe Game
class Board
  WON_GAME = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze

  def initialize
    @table = Array.new(3) { Array.new(3, ' ') }
    @over = false
    @is_full = false
  end

  def display(table = @table)
    board = table.flatten
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts '-----------'
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts '-----------'
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def place_character(character, row, column)
    valid_row = find_valid_row(row)
    valid_column = find_valid_column(valid_row, column)
    @table[valid_row][valid_column] = character
  end

  def find_valid_row(number)
    return number if number.between?(0, 2) && @table[number].any?(' ')

    until number.between?(0, 2) && @table[number].any?(' ')
      puts 'Invalid row, set another row'
      number = gets.chomp.to_i
    end
    number
  end

  def find_valid_column(row, column)
    return column if column.between?(0, 2) && @table[row][column].eql?(' ')

    until column.between?(0, 2) && @table[row][column].eql?(' ')
      puts 'Invalid column, set another column'
      column = gets.chomp.to_i
    end
    column
  end

  def check_won?(character)
    coincidences = WON_GAME.select do |win_combination|
      win_combination.all? { |index| @table[index / 3][index % 3] == character }
    end

    coincidences.empty? ? false : true
  end

  def coincidences(character)
    WON_GAME.select do |win_combination|
      win_combination.all? { |index| @table[index / 3][index % 3] == character }
    end
  end

  def display_with_color(coincidences, color)
    cloned_table = @table.flatten.map.with_index { |v, i| coincidences.flatten.include?(i) ? v.colorize(color) : v }
    display(cloned_table)
  end

  def check_full?
    @table.flatten.all? { |chr| chr != ' ' }
  end
end

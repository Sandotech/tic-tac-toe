# frozen_string_literal: false

class Board
  attr_reader :over, :is_full

  WON_GAME = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  def initialize
    @table = Array.new(3) { Array.new(3, nil) }
    @over = false
    @is_full = false
  end

  def display
    brd = @table.flatten
    board = " 
          #{brd[0]} #{brd[1]} #{brd[2]}
          #{brd[3]} #{brd[4]} #{brd[5]}
          #{brd[6]} #{brd[7]} #{brd[8]}
    "
    puts board
  end

  def set_word(character, row, column)
    @table[row][column] = character
  end

  def check_won?(character)
    # Receive a character and check if there are matches in WON_GAME
    coincidences =  WON_GAME.select do |win_combination|
                      win_combination.all? { |index| @table[index / 3][index % 3] == character }
                    end

    # If there are matches, the game is won
    @over = true if coincidences.any? Numeric
    return coincidences
  end

  def check_full?
    @table.flatten.all? {|chr| chr != nil}
  end
  
  # validate input
end

# board.check_won?('X')
# "- | - | -\n- | - | -\n- | - | -"

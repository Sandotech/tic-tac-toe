# frozen_string_literal: false

class Board
  attr_reader :over

  WON_GAME = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  def initialize
    @table = Array.new(3) { Array.new(3, '-') }
    @over = false
  end

  def display
    str = ''
    @table.each do |row|
      str << "#{row}\n"
    end
    puts str
  end

  def setWord(word, row, column)
    @table[row][column] = word
  end

  def checkWon?(character)
    # Receive a character and check if there are matches in WON_GAME
    WON_GAME.select do |win_combination|
      win_combination.all? { |index| @table[index / 3][index % 3] == character }
    end

    @over = true
  end
end

board = Board.new
board.setWord("X", 0, 0)
board.setWord("X", 0, 1)
board.setWord("X", 0, 2)

puts board.checkWon?('X')
board.display
# "- | - | -\n- | - | -\n- | - | -"

# frozen_string_literal: true

class Square
  attr_reader :over?

  WON_GAME = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [9, 10, 11]]

  def initialize
    @table = Array.new(3) { Array.new(3, '-') }
    @over? = false
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


end

# "- | - | -\n- | - | -\n- | - | -"

# frozen_string_literal: true

# Player of the game with a character value
class Player
  attr_reader :character

  @characters = []

  class << self
    attr_accessor :characters
  end

  def initialize(character)
    @character = validates_character(character)
    self.class.characters << @character
  end

  private

  def validates_character(character)
    valid_length = length_character_validator(character)
    not_repeatable_character(valid_length)
  end

  def length_character_validator(character)
    until character.length == 1
      puts 'Invalid character. Please enter a single character (X or O):'
      character = gets.chomp
    end
    character
  end

  def not_repeatable_character(character)
    until self.class.characters.none? { |char| char == character }
      puts 'Invalid character. Character already taken. Please choose another one (X or O):'
      character = gets.chomp
    end
    character
  end
end

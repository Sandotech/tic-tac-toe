# frozen_string_literal: true

class Player
  attr_reader :character
  @@characters = []

  def initialize(character)
    @character = validates_character(character)
    @@characters << @character
    # @@all_players += 1
  end

  def validates_character(character)
    valid_length = length_character_validator(character) 
    not_repeated = not_repeatable_character(valid_length)
    return not_repeated
  end

  def length_character_validator(character)
    until character.length == 1
      puts "Invalid character. Please enter a single character (X or O):"
      character = gets.chomp
    end
    character
  end

  def not_repeatable_character(character)
    until @@characters.none? { |char| char == character }
      puts "Invalid character. Character already taken. Please choose another one (X or O):"
      character = gets.chomp
    end
    character
  end 
end

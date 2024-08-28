# frozen_string_literal: true

class Player
  attr_reader :character

  def initialize(character)
    @character = character
    # @@all_players += 1
  end
end

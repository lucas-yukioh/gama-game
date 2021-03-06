class Game < ApplicationRecord
  serialize :questions, Array

  extend FriendlyId
  friendly_id :game_slug, use: [:slugged, :finders]

  def game_slug
    "gama-game-#{SecureRandom.hex(4)}"
  end

end

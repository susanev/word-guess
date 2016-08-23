require 'faker'

class Game
	attr_accessor :game_over, :guess_word

	def initialize
		@words = Faker::Lorem.words(10)
		@guess_word = @words[rand(@words.length)]
		@game_over = false
	end
end
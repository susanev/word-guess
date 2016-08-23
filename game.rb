class Game
	attr_accessor :game_over, :guess_word

	def initialize
		@words = ["apple", "orang"]
		@guess_word = @words[rand(@words.length)]
		@game_over = false
	end


end
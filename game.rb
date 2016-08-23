require 'faker'

class Game
	attr_accessor :game_over, :guess_word, :allowed_mistakes

	def initialize
		@words = Faker::Lorem.words(10)
		@guess_word = @words[rand(@words.length)]
		@game_over = false
		@allowed_mistakes = 6
	end

	def execute_turn(player)
		if @guess_word == player.word_so_far.join
			win
		elsif player.mistakes == @allowed_mistakes
			lose
		end
	end

	def matching_indexes(letter)
		indexes = []
		for i in 0..@guess_word.length
			if letter == @guess_word[i]
				indexes.push(i)
			end
		end
		return indexes
	end

	def win
		puts @guess_word
		puts "You win!"
		@game_over = true
	end

	def lose
		puts "You lose!"
		puts "The word was #{@guess_word}"
		@game_over = true	
	end
end
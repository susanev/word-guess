require_relative 'player'
require_relative 'game'

puts "Welcome to Word Guess\n\n"
game = Game.new

print "What is your username? "
player = Player.new(gets.chomp)

puts "Good luck #{player.name}!\n"

player.initialize_word_so_far(game.guess_word.length)

puts game.guess_word

while(!game.game_over)
	player.print_word_so_far

	if player.guessed_letters.length > 0
		puts "You have guessed these letters: #{player.guessed_letters}"
	end

	if player.guessed_words.length > 0
		puts "You have guessed these words: #{player.guessed_words}"
	end

	print "what is your guess? "
	guess = gets.chomp

	if guess.length > 1
		player.guessed_words.push(guess)
		if guess == game.guess_word
			game.win
		else
			puts "That is not the correct word"
			player.mistakes +=1
		end
	else
		player.make_guess(game.matching_indexes(guess), guess)
	end

	game.execute_turn(player)
end
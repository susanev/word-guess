require_relative 'player'
require_relative 'game'

puts "Welcome to Word Guess"
game = Game.new

print "What is your username? "
player = Player.new(gets.chomp)

puts "Good luck #{player.name}!"

player.initialize_word_so_far(game.guess_word.length)

puts game.guess_word

while(!game.game_over)
	player.print_word_so_far

	print "what is your guess? (letter) "
	letter = gets.chomp

	indexes = []
	for i in 0..game.guess_word.length
		if letter == game.guess_word[i]
			indexes.push(i)
		end
	end

	player.make_guess(indexes, letter)

	if game.guess_word == player.word_so_far.join
		player.print_word_so_far
		puts "You win!"
		game.game_over = true
	end
end
require_relative 'player'
require_relative 'game'

puts "Welcome to Word Guess\n\n"
game = Game.new

print "What is your username? "
player = Player.new(gets.chomp)

puts "Good luck #{player.name}!\n"

player.initialize_word_so_far(game.guess_word.length)

while(!game.game_over)
	player.print_word_so_far

	if player.guessed.length > 0
		puts "You have guessed these letters: #{player.guessed}"
	end

	print "what is your guess? (letter) "
	letter = gets.chomp

	player.make_guess(game.matching_indexes(letter), letter)

	game.execute_turn(player)
end
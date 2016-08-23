class Player 

	attr_accessor :name, :turn, :guessed_letters, :guessed_words, :word_so_far, :mistakes

	def initialize(name)
		@name = name
		@turn = 0
		@mistakes = 0
		@guessed_letters = []
		@guessed_words = []
		@word_so_far = []
	end

	def initialize_word_so_far(count)
		for i in 1..count
			@word_so_far.push("_")
		end
	end

	def make_guess(indexes, letter)
		if !(@guessed_letters.include? letter)
			@guessed_letters.push(letter)
			@turn+=1

			if indexes.length > 0
				for i in 0..indexes.length-1
					word_so_far[indexes[i]] = letter
				end
			else
				puts "that letter is not in this word"
				@mistakes+=1
			end
		else
			puts "you already guessed that letter"
		end
	end

	def print_word_so_far
		print "\n"

		for i in word_so_far 
			print (i + " ")
		end

		print "\n"
	end
end
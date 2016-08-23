class Player 

	attr_accessor :name, :turn, :guessed, :word_so_far

	def initialize(name)
		@name = name
		@turn = 0
		@guessed = []
		@word_so_far = []

		for i in 0..4
			@word_so_far.push("_")
		end
	end

	def make_guess(indexes, letter)
		if !(@guessed.include? letter)
			@guessed.push(letter)
			@turn+=1
		else
			puts "you already guessed that letter"
		end

		if indexes.length > 0
			for i in 0..indexes.length-1
				word_so_far[indexes[i]] = letter
			end
		end
	end

	def print_word_so_far
		for i in word_so_far 
			print (i + " ")
		end

		print "\n"
	end
end
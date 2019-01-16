class Game

  def initialize(player, hidden_word)
    @player = player
    @hidden_word = hidden_word
    @guesses = []
  end

  def guess
    c = ""
    while c.length != 1
      puts ""
      print "Guess one letter: "
      c = gets.chomp.downcase
    end
    return c
  end

  def print_snowman(lives)
    snowman = ["", "**", "****", "**", "******", "********",
      "******"]
    snowman[0..lives].each { |snow| puts(snow.center(20)) }
  end

  def play
    print_snowman(@player.lives)
    puts ""
    puts "Guessed so far: #{@hidden_word.display_guessed(@guesses)}"

    guessed_letter = guess()
    @guesses.push(guessed_letter)

    if @hidden_word.contains_letter(guessed_letter)
      guessed = @hidden_word.display_guessed(@guesses)
      puts ""
      puts "CORRECT!"
      puts ""
      if @hidden_word.check_word(guessed)
        return "is_won"
      end
    else
      @player.lose_a_life()
      puts ""
      puts "Wrong!"
      puts "Your snowman is melting!"
      puts "He has #{@player.lives} lives left..."
    end

    if @player.lives > 0
      self.play()
    else
      return "is_lost"
    end
  end
end

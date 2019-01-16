require "pry"

class HiddenWord

  def initialize(hidden_word)
    @hidden_word = hidden_word
  end

  def contains_letter(letter)
    return @hidden_word.include?(letter)
  end

  def display_guessed(letters)
    result = ""
    @hidden_word.each_char { |letter| letters.include?(letter) ?
      (result += letter) : (result += "*") }
    return result
  end

  def check_word(word)
    return @hidden_word == word
  end


end

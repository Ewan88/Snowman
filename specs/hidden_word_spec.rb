require("minitest/autorun")
require("minitest/rg")

require_relative("../hidden_word.rb")

class TestHiddenWord < MiniTest::Test

  def setup
    @hidden_word = HiddenWord.new("word")
  end

  def test_contains_letter
    assert(@hidden_word.contains_letter("r"))
  end

  def test_not_contains_letter
    assert(!@hidden_word.contains_letter("p"))
  end

  def test_display_guessed__single
    assert_equal("**r*", @hidden_word.display_guessed(["r"]))
  end

  def test_display_guessed__multiple
    assert_equal("*or*", @hidden_word.display_guessed(["r", "o"]))
  end

  def test_display_guessed__full
    a = ["r", "o", "d", "w"]
    assert_equal("word", @hidden_word.display_guessed(a))
  end

  def test_display_guessed__none
    assert_equal("****", @hidden_word.display_guessed([]))
  end

  def test_display_guessed__wrong
    assert_equal("****", @hidden_word.display_guessed(["z"]))
  end

  def test_display_guessed__wrong__multiple
    assert_equal("****", @hidden_word.display_guessed(["z", "x"]))
  end

  def test_display_guessed__mix
    assert_equal("**r*", @hidden_word.display_guessed(["r", "z"]))
  end

  def test_display_guessed__multi_letter
    hidden_word = HiddenWord.new("mississipi")
    a = ["i", "s", "a"]
    assert_equal("*ississi*i", hidden_word.display_guessed(a))
  end

  def test_check_word
    assert(@hidden_word.check_word("word"))
  end

end

require("minitest/autorun")
require("minitest/rg")

require_relative("../game.rb")
require_relative("../player.rb")
require_relative("../hidden_word.rb")

class TestGame < MiniTest::Test

  def setup()
    @player = Player.new("Bob")
    @hidden_word = HiddenWord.new("word")
    @game = Game.new(@player, @hidden_word)
  end

  # def test_guess
  #   assert_equal("a", @game.guess)
  # end

  def test_play__win
    assert_equal("is_won", @game.play)
  end


end

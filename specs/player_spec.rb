require("minitest/autorun")
require("minitest/rg")

require_relative("../player.rb")

class TestPlayer < MiniTest::Test

  def setup
    @player = Player.new("Bob")
  end

  def test_name
    assert_equal("Bob", @player.name)
  end

  def test_lives
    assert_equal(6, @player.lives)
  end

  def test_lose_a_life
    @player.lose_a_life
    assert_equal(5, @player.lives)
  end

end

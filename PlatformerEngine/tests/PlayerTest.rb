require "src/Player"
require "src/Position"
require 'test/unit'

class PlayerTest  < Test::Unit::TestCase
  def testCalcJump
    player = Player.new(Position.new(0,500),"Images/guy.gif")
  end
end
require "src/Player"
require "src/Position"
require 'test/unit'

class PlayerTest  < Test::Unit::TestCase
  def testCalcJump
    player = Player.new(Position.new(0,500),"tank") #140*(5*jumpTime + 0.5*-10*jumpTime**2)
    assert_equal(player.calcJumpHeight(0.5),350)
    oldY=player.getY()
    player.jump(0.35)
    assert_equal(player.getY(),oldY- 274.4)
    player.walk(1, 1)
    assert_equal(player.getX(),240)
    player.walk(-1, 1)
    assert_equal(player.getX(), 0)
    player.setDirection("Left")
    assert_equal(player.direction,"Left")
    player.fall(1.75,0)
    assert_equal(player.getY(), 500)
  end
end
require "src/MovingGround"
require "src/Position"
require 'test/unit'

class MovingGroundTest < Test::Unit::TestCase
  def testShift
   movingGround = MovingGround.new(Position.new(100,100), "Images/ground.gif", 3, 3, 3, true)
    movingGround.shift()
    movingGround.shift()
    movingGround.shift()
    assert_equal(Position.new(109,109).getCord(),movingGround.topLeftPosn().getCord())
    movingGround.shift() #doesnt move, but changes the orientation. wait period param here?
    assert_equal(Position.new(109,109).getCord(),movingGround.topLeftPosn().getCord())
    movingGround.shift()
    movingGround.shift()
    movingGround.shift()
    assert_equal(Position.new(100,100).getCord(),movingGround.topLeftPosn().getCord())
  end
  
end
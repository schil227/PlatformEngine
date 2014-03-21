require 'src/MovingGround'
require 'src/Position'
require 'test/unit'

class MovingGroundTest < Test::Unit::TestCase
  def testShift
    MovingGround.new(Position.new(100,100), "Images/ground.gif", 3, 3, 10, true)
    MovingGround.shift()
    MovingGround.shift()
    MovingGround.shift()
    assert_equals(Position.new(109,109).getCord(),MovingGround.topLeftPosn().getCord())
  end
  
end
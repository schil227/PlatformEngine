require "src/Position"
require 'test/unit'

class PositionTest < Test::Unit::TestCase
  def testInitializerType
    assert_raise( RuntimeError ) { Position.new('a',0) }
    assert_raise( RuntimeError ) { Position.new(0,'b') }
  end

  def testGetSetXandY
    posn = Position.new(4,5)
    assert_equal(4, posn.x)
    assert_equal(5, posn.y)
    posn.setPosition(0,1)
    assert_equal(0, posn.x)
    assert_equal(1, posn.y)

  end

  def testGetCord
    assert_equal([2,4], Position.new(2,4).getCord())
    assert_equal([4,4], Position.new(4,4).getCord())
  end
end

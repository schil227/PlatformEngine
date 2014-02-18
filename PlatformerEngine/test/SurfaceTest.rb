require 'src/Surface'
require 'src/Position'
require 'test/unit'

class SurfaceTest < Test::Unit::TestCase
  def testSurfaceInheritance
      posn1 = Position.new(0,0)
      posn2 = Position.new(5,4)
      posn3 = Position.new(0,4)
      surface = Surface.new(posn1,posn2)
      assert_equal(posn1,surface.topLeftPosn)
      assert_equal(posn3.getCord(),surface.bottomLeftPosn.getCord())
    end
end
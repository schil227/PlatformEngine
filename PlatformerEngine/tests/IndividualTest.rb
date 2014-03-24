require 'src/Individual'
require 'src/Position'
require 'test/unit'

class IndividualTest < Test::Unit::TestCase
  def testIndividualInheritance
    posn1 = Position.new(0,0)
    posn2 = Position.new(5,4)
    posn3 = Position.new(0,4)
    individual = Individual.new(posn1,posn2)
    assert_equal(posn1,individual.topLeftPosn)
    assert_equal(posn3.getCord(),individual.bottomLeftPosn.getCord())
  end

  def testMove
    posn1 = Position.new(0,0)
    posn2 = Position.new(5,4)
    posn3 = Position.new(0,1)
    posn4 = Position.new(2,1)
    individual = Individual.new(posn1,posn2)
    individual.move(0,1)
    assert_equal(posn3.getCord(),individual.topLeftPosn.getCord())
    individual.move(2,0)
    assert_equal(posn4.getCord(),individual.topLeftPosn.getCord())
    individual.move(-2,0)
    assert_equal(posn3.getCord(),individual.topLeftPosn.getCord())
  end
end
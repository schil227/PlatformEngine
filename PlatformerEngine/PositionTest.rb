require "./Position"
#gem "minitest"
require 'test/unit'

class PositionTest < Test::Unit::TestCase
  def testGetCord
      assert_equal([2,4], Position.new(2,4).getCord())
      assert_equal([4,4], Position.new(4,4).getCord())
    end
end

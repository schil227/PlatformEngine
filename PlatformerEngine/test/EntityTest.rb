require "src/Position"
require "src/Entity"
require 'test/unit'

class EntityTest < Test::Unit::TestCase
  def testInitializerType
     assert_raise( RuntimeError ) { Entity.new(Position.new(0,0),'b') }
     assert_raise( RuntimeError ) { Entity.new(Position.new(0,0),Position.new(0,0)) }
   end
   
   def testCollision
     entity = Entity.new(Position.new(0,0),Position.new(5,4))
     posnInside = Position.new(2,3)
     posnOutside = Position.new(6,8)
     posnHorizontal = Position.new(0,2)
     posnVertical = Position.new(5,3)
     posnOnPoint = Position.new(5,4)
     assert_equal(true,entity.collision(posnInside))
     assert_equal(false,entity.collision(posnOutside))
     assert_equal(true,entity.collision(posnHorizontal))
     assert_equal(true,entity.collision(posnVertical))
     assert_equal(true,entity.collision(posnOnPoint))
   end
end
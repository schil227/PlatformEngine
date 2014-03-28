require "src/Entity"

class Individual < Entity
  def initialize(topLeftPosn, bottomRightPosn)
    super(topLeftPosn, bottomRightPosn)
  end

  def move(x,y)
    @bottomLeftPosn.setPosition(@bottomLeftPosn.x + x, @bottomLeftPosn.y + y)
    @bottomRightPosn.setPosition(@bottomRightPosn.x + x, @bottomRightPosn.y + y)
    @topLeftPosn.setPosition(@topLeftPosn.x + x, @topLeftPosn.y + y)
    @topRightPosn.setPosition(@topRightPosn.x + x, @topRightPosn.y + y)
  end
  
  
  
end
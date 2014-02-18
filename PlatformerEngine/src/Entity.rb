require "rubygame"

include Rubygame

class Entity
  include Sprites::Sprite
  def initialize(topLeftPosn, bottomRightPosn)
    raise unless (topLeftPosn.is_a?(Position) && bottomRightPosn.is_a?(Position))
    raise if (topLeftPosn.x >= bottomRightPosn.x || topLeftPosn.y >= bottomRightPosn.y)
    super()
    @topLeftPosn = topLeftPosn
    @topRightPosn = Position.new(bottomRightPosn.x,topLeftPosn.y)
    @bottomLeftPosn = Position.new(topLeftPosn.x,bottomRightPosn.y)
    @bottomRightPosn = bottomRightPosn
    
    def self.topLeftPosn
      @topLeftPosn
    end

    def self.topRightPosn
      @topRightPosn
    end

    def self.bottomLeftPosn
      @bottomLeftPosn
    end

    def self.bottomRightPosn
      @bottomRightPosn
    end
  end
  
  def getBoxPosn()
    return [@topLeftPosn,@topRightPosn,@bottomLeftPosn,@bottomRightPosn]
  end
  
  def collision(posn)
    return (@topLeftPosn.x <= posn.x && posn.x <= @bottomRightPosn.x) && (@topLeftPosn.y <= posn.y && posn.y <= @bottomRightPosn.y)
  end

end
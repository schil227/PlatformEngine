require "rubygame"
require "src/Individual"

include Rubygame

class Player < Individual
  include Sprites::Sprite
  def initialize(topLeftPosn, image)
    @image = (Rubygame::Surface.load(image))
    super(topLeftPosn, Position.new(@image.w + topLeftPosn.x, @image.h + topLeftPosn.y))
    @rect  = Rubygame::Rect.new(topLeftPosn.x, topLeftPosn.y, @image.w, @image.h)
    @jumpSum = 0
    
    def self.jumpSum
      return @jumpSum
    end
  end
  
  def jump(jumpTime)
    self.move(0,-1*calcJumpHeight(jumpTime))
    p("moved to " + self.topLeftPosn.getCord().to_s)
  end

  def calcJumpHeight(jumpTime) 
    p("jumpTime: " + jumpTime.to_s)
    if @jumpSum > 15
      return 0
    else
      @jumpSum = 15 - 12*jumpTime
    end
  end
  
  def update on_surface
    @rect.topleft = self.topLeftPosn.getCord
  end

  def draw  on_surface
    @image.blit  on_surface, @rect
  end
end
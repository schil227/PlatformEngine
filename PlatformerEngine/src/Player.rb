require "rubygame"
require "src/Individual"

include Rubygame

class Player < Individual
  include Sprites::Sprite
  def initialize(topLeftPosn, image)
    @image = (Rubygame::Surface.load(image))
    super(topLeftPosn, Position.new(@image.w + topLeftPosn.x, @image.h + topLeftPosn.y))
    @rect  = Rubygame::Rect.new(topLeftPosn.x, topLeftPosn.y, @image.w, @image.h)
  end
  
  def jump(jumpTime)
    self.move(self.getX(),self.getY() + calcJumpHeight(jumpTime))
  end

  def calcJumpHeight(jumpTime)
    p("jumpTime: " + jumpTime.to_s)
    if jumpTime > 1.25
      return 0
    else
      return 15 - 12*jumpTime
    end
  end
  
  def update on_surface
    @rect.topleft = self.topLeftPosn.getCord
  end

  def draw  on_surface
    @image.blit  on_surface, @rect
  end
end
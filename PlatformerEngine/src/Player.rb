require "rubygame"
require "src/Individual"

include Rubygame

class Player < Individual
  include Sprites::Sprite
  def initialize(topLeftPosn, image)
    @image = (Rubygame::Surface.load(image))
    super(topLeftPosn, Position.new(@image.w + topLeftPosn.x, @image.h + topLeftPosn.y))
    @rect  = Rubygame::Rect.new(topLeftPosn.x, topLeftPosn.y, @image.w, @image.h)
    @baseHeight = self.getY()
    def self.baseHeight
      return @baseHeight
    end

  end

  def jump(jumpTime)
    self.absoluteMove(self.getX(),@baseHeight + -1*calcJumpHeight(jumpTime))
    p("moved to " + self.topLeftPosn.getCord().to_s)
  end

  def fall(fallTime, timePassed)
    self.absoluteMove(self.getX(),@baseHeight + -1*calcFallHeight(fallTime, timePassed))
    p("moved to " + self.topLeftPosn.getCord().to_s)
  end

  def calcJumpHeight(jumpTime)
    calc = 140*(7*jumpTime + -4*jumpTime**2)
    return calc
  end

  def calcFallHeight(fallTime, timePassed)
    calc = 140*(7*fallTime + -4*(fallTime + timePassed)**2)
    p("fall height: " + calc.to_s + ", time passed: " + timePassed.to_s)
    return calc
  end

  def isFalling(timeSum)
    return 700 - 1400*timeSum <0
  end

  def setCurrentBaseHeight()
    @baseHeight = self.getY()
  end

  def update on_surface
    @rect.topleft = self.topLeftPosn.getCord
  end

  def draw  on_surface
    @image.blit  on_surface, @rect
  end
end
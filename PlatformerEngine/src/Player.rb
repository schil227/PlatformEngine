require "rubygame"
require "src/Individual"

include Rubygame

class Player < Individual
  include Sprites::Sprite
  def initialize(topLeftPosn, image)
    @imageName = image
    @direction = "Right"
    @imageLoadName = "Images/" + @imageName + @direction + "1.gif"
   
    @image = (Rubygame::Surface.load(@imageLoadName))
    super(topLeftPosn, Position.new(@image.w + topLeftPosn.x, @image.h + topLeftPosn.y))
    @rect  = Rubygame::Rect.new(topLeftPosn.x, topLeftPosn.y, @image.w, @image.h)
    @baseHeight = self.getY()
    @speed = 9

    @timeSum = 0
    def self.direction
      return @direction
    end

    def self.imageLoadName
      @imageLoadName
    end

    def self.speed
      return @speed
    end

    def self.baseHeight
      return @baseHeight
    end

  end

  def DirectionIsRight()
    return @direction == "Right"
  end

  def setDirection(direction)
    @direction = direction
  end

  def setSpeed(speed)
    @speed = speed
  end

  def jump(jumpTime)
    self.absoluteMove(self.getX(),@baseHeight + -1*calcJumpHeight(jumpTime))
    p("moved to " + self.topLeftPosn.getCord().to_s)
  end

  def fall(fallTime, timePassed)
    self.absoluteMove(self.getX(),@baseHeight + -1*calcFallHeight(fallTime, timePassed))
    p("moved to " + self.topLeftPosn.getCord().to_s)
  end

  def walk(direction)
      self.move(speed*direction,0)

  end

  def calcJumpHeight(jumpTime)
    calc = 140*(7*jumpTime + -4*(jumpTime)**2)
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

  def changeImageDirection()
    p("will be changed to: " + ("Images/" + @imageName + @direction + "1.gif"))
    @imageLoadName =  "Images/" + @imageName + @direction + "1.gif"
    p("changed direction: " + @imageLoadName)
    @image = (Rubygame::Surface.load(@imageLoadName))
    @rect  = Rubygame::Rect.new(topLeftPosn.x, topLeftPosn.y, @image.w, @image.h)
  end

  def update on_surface
    if(/#{@direction}/.match(@imageLoadName) == nil )
      p("changing Direction!")
      changeImageDirection()
    end
    @rect.topleft = self.topLeftPosn.getCord
  end

  def draw  on_surface
    @image.blit  on_surface, @rect
  end
end
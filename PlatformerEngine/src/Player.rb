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
    @baseHeight = self.getY()
    def self.jumpSum
      return @jumpSum
    end
    
    def self.baseHeight
      return @baseHeight
    end
    
  end

  def setJumpSum(sum)
    @jumpSum = sum
  end

  def jump(jumpTime)
    calcJumpHeight(jumpTime)
    self.absoluteMove(self.getX(),@baseHeight + -1*@jumpSum)
    p("moved to " + self.topLeftPosn.getCord().to_s)
  end
  
  def fall(fallTime)
      self.absoluteMove(0,calcFallHeight(fallTime))
      p("moved to " + self.topLeftPosn.getCord().to_s)
    end

  def calcJumpHeight(jumpTime)
    p("jumpSum: " + @jumpSum.to_s)
    #    calc = (30 - 4*(jumpTime*10)**2) #25 timesteps from bottom to top
    #    if @jumpSum > 150 || calc <0
    #      return 0
    #    else
    
    calc = 140*(5*jumpTime + 0.5*-10*jumpTime**2)
    @jumpSum = calc
    if calc > 0 #&& @jumpSum < 150
      return calc
    else
      return 0
    end
    
#    if jumpTime < 0.25/2.0
#      @jumpSum = @jumpSum + calc
#      calc = 7*2
#    elsif jumpTime < 0.5/2.0
#      calc = 5*2
#    elsif jumpTime < 0.75/2.0
#      calc = 3*2
#    elsif jumpTime < 1/2.0
#      calc = 1*2
#    else
#      calc = 0
#    end
#    @jumpSum = calc
#    return calc
  end
  
  def calcFallHeight(fallTime)
    #    calc = (30 - 4*(jumpTime*10)**2) #25 timesteps from bottom to top
    #    if @jumpSum > 150 || calc <0
    #      return 0
    #    else
    calc = 140*(5*(0.5 + fallTime) + 0.5*-10*(fallTime)**2)
    if fallTime < 0.05/2.0
      calc = 0
    elsif fallTime < 0.25/2.0
      calc = 1*2
    elsif fallTime < 0.5/2.0
      calc = 3*2
    elsif fallTime < 0.75/2.0
      calc = 5*2
    else
      calc = 7*2
    end
    @jumpSum = calc
    return calc
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
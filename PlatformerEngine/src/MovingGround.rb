require "rubygame"
require "src/Individual"

include Rubygame

class MovingGround < Individual
  include Sprites::Sprite
  def initialize(topLeftPosn, image, orientationX, orientationY, cycle, shouldCycle)

    @image = (Rubygame::Surface.load(image))
    super(topLeftPosn, Position.new(@image.w + topLeftPosn.x, @image.h + topLeftPosn.y))
    @rect  = Rubygame::Rect.new(topLeftPosn.x, topLeftPosn.y, @image.w, @image.h)
    @orientationX = orientationX
    @orientationY = orientationY
    @shouldCycle = shouldCycle
    @count = 0
    @goForward = true
    @firstRun = true
    def self.orientationX
      @orientationX
    end

    def self.orientationY
      @orientationY
    end

    def self.cycle
      @cycle
    end

    def self.shouldCycle
      @shouldCycle
    end

    def self.count
      @count
    end

    def self.goForward
      @goForward
    end

    def self.firstRun
      @firstRun
    end

  end

  def shift()
    if @shouldCycle || @firstRun
      if @goForward
        if (@count < @cycle)
          self.move(@orientationX, @orientationY)
        else
          @goForward = false
          @count = 0
        end
      else
        if (@count < @cycle)
          self.move(-1*@orientationX, -1*@orientationY)
        else
          @goForward = true
          @count = 0
        end
      end
      @firstRun = false
    end
  end

  def update on_surface
    shift()
    @rect.topleft = self.topLeftPosn.getCord
  end

  def draw  on_surface
    @image.blit  on_surface, @rect
  end

end
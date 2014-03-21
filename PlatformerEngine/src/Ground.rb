require "rubygame"
require "src/PlatformSurface"

include Rubygame

class Ground < PlatformSurface
  include Sprites::Sprite
 
  def initialize(topLeftPosn, image)
    
     @image = (Rubygame::Surface.load(image))
    super(topLeftPosn, Position.new(@image.w + topLeftPosn.x, @image.h + topLeftPosn.y))
     @rect  = Rubygame::Rect.new(topLeftPosn.x, topLeftPosn.y, @image.w, @image.h)
     
  end

  def update seconds_passed
    @rect.topleft = self.topLeftPosn.getCord
  end
  
  def draw  on_surface
    @image.blit  on_surface, @rect
  end

end
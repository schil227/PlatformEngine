require "rubygame"
require "src/Surface"

include Rubygame

class Ground < Surface
  include Sprites::Sprite
 
  def initialize(topLeftPosn, bottomRightPosn, image)
    super(topLeftPosn, bottomRightPosn)
    
     @image = (Surface.load(image + "1.gif"))
     @rect  = Rubygame::Rect.new(topLeftPosn.x, topLeftPosn.y, @image.w, @image.h)
     
  end

  def draw  on_surface
    @image.blit  on_surface, @rect
    @ammoImage.blit  on_surface, @rect
  end

end
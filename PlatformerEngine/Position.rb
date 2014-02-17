class Position
  def initialize(x,y)
    @x = x
    @y = y
  end

  def self.x
    @x
  end

  def self.y
    @y
  end

  def getCord()
    [@x,@y]
  end
  
end
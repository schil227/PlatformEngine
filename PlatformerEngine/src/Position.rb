class Position
  def initialize(x,y)
    raise unless x.is_a?(Numeric)
    raise unless y.is_a?(Numeric)
    @x = x
    @y = y
    def self.x
      @x
    end

    def self.y
      @y
    end
  end

  def getCord()
    [@x,@y]
  end
  
  def setPosition(x,y)
    @x=x
    @y=y
  end

end
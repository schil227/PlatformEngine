#!/usr/bin/ruby
Dir["src/*.rb"].each {|file|
  if (file != "src/main.rb")
    p("requiring file " + file)
    require file
  end
}
#require "src/Entity.rb"
#require "src/Individual.rb"
#require "src/PlatformSurface.rb"
#require "src/Ground.rb"
#require "src/Position.rb"
#require "src/MovingGround.rb"

require "rubygems"
require "rubygame"

include Rubygame

def main
  @X = 100
  @Y = 100
  @screen = Screen.open [ @X*8, @Y*6]
  @clock = Clock.new
  @clock.target_framerate = 60
  @clock.enable_tick_events

  @sprites = Sprites::Group.new
  Sprites::UpdateGroup.extend_object @sprites
  @background = Rubygame::Surface.load "Images/background.jpg"
  @background.blit @screen, [ 0, 0]

  @event_queue = EventQueue.new
  @event_queue.enable_new_style_events
  @sprites << Ground.new(Position.new(50,50),"Images/ground.gif")
  @sprites << MovingGround.new(Position.new(100,100), "Images/ground.gif", 16, 16, 10, true)
  player = Player.new(Position.new(0,500), "tank")
  @sprites <<  player
  isRunning = true
  count = 0
  leftHeld = false
  rightHeld = false
  jumpTime = 0
  jumpHeld = false
  isFalling = false
  fallTime= 0
  while isRunning
    count = count + 1

    #    p("count:"+count.to_s+", jumpHeld:" + jumpHeld.to_s)
    #jp("count: " + count.to_s)
    seconds_passed = @clock.tick().seconds
    #p("seconds: " + seconds_passed.to_s)
    @sprites.undraw @screen, @background

    if(jumpHeld && !isFalling )
      p("baseHeight: " +player.baseHeight.to_s)
      p("key held! jumpHeld: " + jumpHeld.to_s + ", falling?" + isFalling.to_s)
      jumpTime += seconds_passed
      if(player.isFalling(jumpTime))
        p("negitive velocity")
        isFalling = true
        jumpHeld = false
      else
        player.jump(jumpTime)
      end
    elsif( isFalling)
      if player.getY() < 500
        p("baseHeight: " +player.baseHeight.to_s)
        p("falling")
        jumpTime += seconds_passed
        fallTime += seconds_passed
        player.fall(jumpTime, fallTime)
      else
        p("baseHeight: " +player.baseHeight.to_s)
        p("falling is false")
        jumpTime = 0
        fallTime = 0
        isFalling = false
      end
    end

    if(leftHeld ^ rightHeld) # ^ is xor; a and !b or !a and b
      if(!jumpHeld && !isFalling)
        if(leftHeld)
          player.setDirection("Right")
        else
          player.setDirection("Left")
        end
      end
      if(leftHeld)
        player.walk(1)
      else
        player.walk(-1)
      end
    end

    @event_queue.each do |event|
      case event
      when Events::QuitRequested
        throw :rubygame_quit
      when Events::KeyPressed
        if(event.key == :space)
          jumpHeld = true
          if(isFalling == false)
            player.setCurrentBaseHeight()
          end
          p("key pressed! jumpHeld: " + jumpHeld.to_s + ", falling?" + isFalling.to_s)

        elsif(event.key == :r)
          player.absoluteMove(0,500)

        elsif(event.key == :d)
          leftHeld = true
          if(!jumpHeld && !isFalling)
            player.setDirection("Right")
          end
        elsif(event.key == :a)
          rightHeld = true
          if(!jumpHeld && !isFalling)
            player.setDirection("Left")
          end
        end
      when Events::KeyReleased
        if(event.key == :space)
          jumpHeld = false
          isFalling = true
          #  falling = true
          p("key released! jumpHeld: " + jumpHeld.to_s + ", falling?" + isFalling.to_s)
        elsif(event.key == :d)
          leftHeld = false
        elsif(event.key == :a)
          rightHeld = false
        end
      end
      #      p("in the queue:"+ count.to_s)
    end

    # Give all of the sprites an opportunity to move themselves to a new location
    @sprites.update  seconds_passed

    # Draw all of the sprites
    @sprites.draw @screen

    @screen.flip
  end

end

main()
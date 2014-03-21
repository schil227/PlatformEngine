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
  @screen = Screen.open [ @X*8, @Y*8]
  @clock = Clock.new
  @clock.target_framerate = 15
  @clock.enable_tick_events

  @sprites = Sprites::Group.new
  Sprites::UpdateGroup.extend_object @sprites
  @background = Rubygame::Surface.load "Images/background.jpg"
  @background.blit @screen, [ 0, 0]

  @event_queue = EventQueue.new
  @event_queue.enable_new_style_events
  @sprites << Ground.new(Position.new(50,50),"Images/ground.gif")
  @sprites << MovingGround.new(Position.new(100,100), "Images/ground.gif", 3, 3, 10, true)
  isRunning = true
  count = 0
  while isRunning
    count = count + 1
    
    p("count: " + count.to_s)
    seconds_passed = @clock.tick().seconds
    @sprites.undraw @screen, @background

    # Give all of the sprites an opportunity to move themselves to a new location
    @sprites.update  seconds_passed

    # Draw all of the sprites
    @sprites.draw @screen

    @screen.flip
  end

end

main()
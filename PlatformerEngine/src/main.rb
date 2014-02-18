#!/usr/bin/ruby
Dir["src/*.rb"].each {|file| 
  require file
}

require "rubygems"
require "rubygame"
include Rubygame

def main
  @X = 100
  @Y = 100
  @screen = Screen.open [ @X*14, @Y*13]
  @clock = Clock.new
  @clock.target_framerate = 60
  @clock.enable_tick_events

  @sprites = Sprites::Group.new
  Sprites::UpdateGroup.extend_object @sprites
  @background = Surface.load "Images/background.jpg"
  @background.blit @screen, [ 0, 0]

  @event_queue = EventQueue.new
  @event_queue.enable_new_style_events
  @sprites << Ground.new(40,50,"Images/ground.gif")
  
  isRunning = true
  while isRunning
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
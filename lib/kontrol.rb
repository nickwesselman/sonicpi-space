
class Kontrol
  def initialize
    @slots = []
    8.times do
      @slots.push(KontrolSlot.new)
    end
    @buttons = []
    5.times do
      @buttons.push(KontrolButton.new)
    end
    @rewind = @buttons[0]
    @forward = @buttons[1]
    @stop = @buttons[2]
    @play = @buttons[3]
    @record = @buttons[4]
  end
  
  attr_reader :slots, :buttons, :rewind, :forward, :stop, :play, :record
end

class KontrolSlot
  def initialize
    @knob = 63.5
    @slide = 127
    @s = KontrolButton.new
    @m = KontrolButton.new
    @r = KontrolButton.new
  end
  attr_accessor :knob, :slide
  attr_reader :s, :m, :r
end

class KontrolButton
  def initialize
    @pressed = false
    @down = false
  end
  
  attr_reader :down
  
  def push_down
    @down = true
  end
  
  def release
    @down = false
    @pressed = true
  end
  
  # toggle off after checking
  def was_pressed
    was_pressed = @pressed
    @pressed = false
    was_pressed
  end
end

kontrol = Kontrol.new
define :kontrol do
  kontrol
end

define :kontrol_button do |button, value|
  if (value > 0)
    button.push_down
  else
    button.release
  end
end

live_loop :kontrol_control do
  use_real_time
  control_index, value = sync "/midi:nanokontrol2_slider_knob:1/control_change"
  case control_index
  when 0..7
    slot = kontrol.slots[control_index]
    slot.slide = value
  when 16..23
    slot = kontrol.slots[control_index-16]
    slot.knob = value
  when 32..39
    slot = kontrol.slots[control_index-32]
    kontrol_button slot.s, value
  when 48..55
    slot = kontrol.slots[control_index-48]
    kontrol_button slot.m, value
  when 64..71
    slot = kontrol.slots[control_index-64]
    kontrol_button slot.r, value
  when 43
    button = kontrol.buttons[0]
    kontrol_button button, value
  when 44
    button = kontrol.buttons[1]
    kontrol_button button, value
  when 42
    button = kontrol.buttons[2]
    kontrol_button button, value
  when 41
    button = kontrol.buttons[3]
    kontrol_button button, value
  when 45
    button = kontrol.buttons[4]
    kontrol_button button, value
  end
end

##| live_loop :kontrol_test do
##|   slot = kontrol.slots[0]
##|   amp = slot.slide/127.0 #between 0 and 1
##|   pan = slot.knob/63.5 - 1 #between -1 and 1
##|   cutoff = 130
##|   if (slot.s.down)
##|     cutoff = 90
##|   elsif (slot.m.down)
##|     cutoff = 50
##|   elsif (slot.r.down)
##|     cutoff = 20
##|   end
##|   note = :d4
##|   if (kontrol.buttons[0].down)
##|     note = :e4
##|   end
##|   if (kontrol.forward.was_pressed)
##|     use_synth synth_names[rrand_i(0, 10)]
##|   end
##|   play note, amp: amp, pan: pan, cutoff: cutoff
##|   sleep 1
##| end

# Welcome to Sonic Pi v2.11.1
use_bpm 70

live_loop :metronome do
  sleep 0.25
end

##| live_loop :beep do
##|   sample :elec_blip
##|   sleep 1
##| end

live_loop :kick do
  sync :metronome
  if (bools 1,0,0,0,0,0,0,0).tick then
    sample :bd_tek
  end
end

live_loop :snare do
  sync :metronome
  with_fx :bitcrusher do
    if (bools 0,0,0,0,1,0,0,0).tick then
      sample :bd_haus
    end
  end
end

live_loop :pulse do
  sync :metronome
  use_synth :mod_pulse
  with_fx :reverb, room: 1 do
    if (spread 1, 32).tick then
      cue :leadsync
      play_chord chord(:D3, :minor), amp: 0.25, release: 2
      sleep 0.75
      play_chord chord(:B4, :minor), amp: 0.25
      sleep 0.5
      play_chord chord(:G3, :minor), amp: 0.25, release: 2
    end
  end
end

live_loop :bass do
  sync :metronome
  use_synth :growl
  with_fx :lpf do
    sleep 2
    play note(:D2)
    sleep 1.5
    play note(:G2), release: 2
  end
end

live_loop :lead2 do
  sync :leadsync
  with_fx :reverb, room: 1 do
    sleep 2
    sample :ambi_choir, pitch_stretch: 6
  end
end
use_bpm 90

cut = 120

live_loop :met do
  sleep 1
end


live_loop :kick, sync: :met do
  with_fx :bitcrusher do
    ##| stop
    a = 1
    if (spread 1,4).tick
      sample :drum_heavy_kick, amp: a #, cutoff: cut
    end
    sleep 0.25
  end
end

snare_rhythm = [0, 0, 0, 0,
                1, 0, 0, 0,
                0, 0, 0, 0,
                1, 0, 0, 0].ring

live_loop :snare, sync: :met do
  with_fx :reverb, reps: 16 do
    with_fx :bitcrusher do
      ##| stop
      a = 0.5
      if snare_rhythm.tick > 0
        sample :drum_snare_soft, amp: a, cutoff: cut
      end
      sleep 0.25
    end
  end
end


hats_rhythm = [1, 0, 1, 0,
               1, 0, 0.25,
               0, 0, 1, 0.5,
               1, 0, 0.25, 0.25].ring
live_loop :hats, sync: :met do
  with_fx :reverb, reps: 32 do
    with_fx :bitcrusher do
      ##| stop
      a = 0.5
      if hats_rhythm.tick > 0
        sample :drum_cymbal_closed, amp: a * hats_rhythm.look, release: 0.125, cutoff: cut
      end
      sleep 0.25
    end
  end
end


live_loop :robo, sync: :met do
  ##| stop
  a = 0.5
  if (spread 1, 4*16).tick
    sample :mehackit_robot3, release: 0.25, amp: a, cutoff: cut
    sample :mehackit_robot1, release: 0.25, amp: a, cutoff: cut
  end
  sleep 0.25
end

bass_notes = (stretch :d1, 12, [:e1, :f1, :e1], 8, :c1, 4)
bass_rhythm = [1, 1, 0, 0,
               1, 0, 1, 0,
               1, 0.5, 1, 0,
               1, 0.5, 0.5, 0].ring

live_loop :bass, sync: :met do
  with_fx :reverb, room: 0.8, mix: 0.5, reps: 16 do
    ##| stop
    a = 0.7
    with_synth :fm do
      if bass_rhythm.tick > 0
        amp = (line 0, a, steps: 32, inclusive: true).ramp.look * bass_rhythm.look
        play bass_notes.look, amp: amp, cutoff: 90, divisor: 1, depth: 2.5, attack: 0.1
      end
    end
    sleep 0.25
  end
end

melody_notes = (chord :d3, :minor, num_octaves: 1).take(6).mirror
melody_rhythm = [1, 0.5, 0, 0,
                 1, 0, 1, 0,
                 1, 1, 1, 0,
                 1, 0.5, 1, 0]

live_loop :melody, sync: :met do
  with_fx :reverb, room: 0.5, mix: 0.5, reps: 16 do
    ##| stop
    a = 0.35
    with_synth :saw do
      if melody_rhythm.tick > 0
        note = melody_notes.look
        ##| if one_in(7)
        ##|   note = note - 1
        ##| end
        pan = one_in(4) ? 1 : -1
        amp = (line 0, a, steps: 64, inclusive: true).ramp.look * melody_rhythm.look
        with_synth_defaults amp: amp, cutoff: cut, release: 0.3, attack: 0.1 do
          play note
        end
      end
    end
    sleep 0.25
  end
end
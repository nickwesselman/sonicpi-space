## EXERCISE: Time to Jam!

live_loop :synth do
    # Pick a synth!
    use_synth :fm

    # Play some notes
    play :c4
    sleep 0.5
    play :g4
    sleep 0.25
    play :aB4
    sleep 0.25
    play :f4
    sleep 1
end
  
live_loop :sample do
    # Pick a sample and beat_stretch it!
    sample :loop_amen, beat_stretch: 2
    sleep 2
end
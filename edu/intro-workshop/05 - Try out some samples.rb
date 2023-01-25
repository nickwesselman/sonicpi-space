## EXERCISE: Try out some samples
# NOTE: You can't have more than one in your code at the same time!

loop do
    sample :loop_compus
    sleep sample_duration(:loop_compus)
end

loop do
    sample :ambi_drone
    sample :ambi_glass_hum
    sample :ambi_lunar_land
    sleep 1
end

loop do
    sample :drum_heavy_kick
    sleep 0.5
    sample :drum_snare_hard
    sleep 0.5
end

loop do
    sample :loop_amen, beat_stretch: 2, attack: 0.5, release: 0.5
    sleep 2
end
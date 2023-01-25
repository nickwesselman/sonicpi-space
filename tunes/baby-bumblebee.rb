use_synth :piano

play :c4
sleep 1
play :f4
sleep 0.5
play :a4
sleep 0.5
play :g4
sleep 0.5
play :f4
sleep 0.5
play :d4
sleep 1
play :d4
sleep 1
play :c4
sleep 1
play :c4
sleep 1
play :f4
sleep 2

play :g4
sleep 1
play :g4
sleep 1
play :a4
sleep 1
play :a4
sleep 1
play :g4
sleep 0.5
play :a4
sleep 0.5
play :g4
sleep 0.5
play :e4
sleep 0.5
play :d4
sleep 1

play :c4
sleep 1
play :f4
sleep 0.5
play :a4
sleep 0.5
play :g4
sleep 0.5
play :f4
sleep 0.5
play :d4
sleep 1
play :d4
sleep 1
play :c4
sleep 1
play :c4
sleep 1
play :f4
sleep 2

with_fx :bitcrusher do
  with_synth_defaults amp: 2 do
    play :g4
    sleep 2
    play :g4
    sleep 0.5
    play :g4
    sleep 1
    play :f4
    sleep 1
  end
end

###
### Intro to Sonic Pi Workshop
### https://docs.google.com/presentation/d/19YqGtLqQXgnKhyXM4Wdip5Ks6bUxBCddJI5zXmzj3Ok/edit?usp=sharing
### Examples and Exercises
### Nick Wesselman
###
### Based on content by Giles Booth
### https://docs.google.com/presentation/d/1hM8h_EJXejI0-OGHbXvQfRCBAXrMnCGGrOX6CnF85os/edit#slide=id.p
###

# This file is not meant to be played straight through.
# Copy/paste values into your buffer. :)

### GETTING STARTED

# Let's make a noise

play :c4


# Try three sounds

play :c4
play :g4
play :e4


# Get some sleep!
# and some more notes

play :c4
sleep 0.5
play :d4
sleep 0.5
play :e4
sleep 0.5
play :c4


### PITCH AND NOTES

# Not all notes have names!

use_synth :fm
note = 60
30.times do
  play note
  sleep 0.25
  note = note + 0.1
end


# Notes in the same scale work together

use_synth :fm

#C major
play :c4
sleep 0.25
play :d4
sleep 0.25
play :e4
sleep 0.25
play :f4
sleep 0.25
play :g4
sleep 0.25
play :a4
sleep 0.25
play :b4
sleep 0.25
play :c5
sleep 2

## C major 1-6-5-4
2.times do
  play :c4
  sleep 0.5
  play :g4
  sleep 0.25
  play :a4
  sleep 0.25
  play :f4
  sleep 2
end

## C minor
play :c4
sleep 0.25
play :d4
sleep 0.25
play :eB4
sleep 0.25
play :f4
sleep 0.25
play :g4
sleep 0.25
play :aB4
sleep 0.25
play :bB4
sleep 0.25
play :c5
sleep 2

## C minor 1-6-4-5
2.times do
  play :c4
  sleep 0.5
  play :g4
  sleep 0.25
  play :aB4
  sleep 0.25
  play :f4
  sleep 2
end


## EXERCISE: Let's make a tune

## C major
## g3  a3  b3 c4  d4  e4  f4  g4  a4  b4  c5  d5  e5 f5

## C minor
## g3  aB3  bB3  c4  d4  eB4  f4  g4  aB4  bB4  c5  d5  eB5  f5

use_synth :hoover

play :c4
sleep 0.5
play :g4
sleep 0.5
play :e4
sleep 0.25
play :c4
sleep 0.25
play :b3

sleep 1

play :c4
sleep 0.5
play :g4
sleep 0.5
play :e4
sleep 0.25
play :c4
sleep 0.25
play :g4

sleep 1

play :d4
sleep 0.5
play :c4
sleep 0.5
play :e4
sleep 0.25
play :c4
sleep 0.25
play :d4

sleep 1

play :c4
sleep 0.5
play :g4
sleep 0.5
play :e4
sleep 0.25
play :c4
sleep 0.25
play :c4

sleep 1


### ENVELOPES AND VARIABLES

# Release
play 60, release: 2
# Attack
play 60, attack: 0.5
# Sustain
play 60, attack: 0.3, sustain: 1, release: 1
# Decay
play 60, attack: 0.1, attack_level: 1, decay: 0.2, sustain_level: 0.4, sustain: 1, release: 0.5


## EXERCISE: Experiment with different ADSR argument values
play 60, attack: 0.1, attack_level: 1, decay: 0.2, decay_level: 0.4, sustain_level: 0.4, sustain: 1, release: 0.5


## Variables

play :c4
sleep 0.25
play :c4
sleep 0.25
play :c4

# vs.

note = :c4
play note
sleep 0.25
play note
sleep 0.25
play note

# vs

note = :c4
sleep_amount = 0.25
play note
sleep sleep_amount
play note
sleep sleep_amount
play note


## EXERCISE: Control note and envelope using variables
note = :c4
attack = 0.5
attack_level = 1
decay = 0.5
sustain = 2
sustain_level = 0.25
decay_level = sustain_level
release = 2

play note, attack: attack, attack_level: attack_level, decay: decay, decay_level: decay_level, sustain: sustain, sustain_level: sustain_level, release: release


### ARRAYS AND LOOPS

## Arrays

notes = [:c4, :d4, :e4, :f4, :g4, :a4, :b4]
play notes[0] #array indexes are 0-based in Sonic Pi
sleep 0.25
play notes[1]
sleep 0.25
play notes[2]
sleep 0.25
play notes[6]


## Loops

# Basic Repetition
2.times do
  play :c4
  sleep 0.5
  play :d4
  sleep 0.5
  play :e4
  sleep 0.5
  play :c4
  sleep 0.5
end

# Infinite Repetition
loop do
  play :c4
  sleep 0.5
  play :d4
  sleep 0.5
  play :e4
  sleep 0.5
  play :c4
  sleep 0.5
end

# Loop array values
notes = [:c4, :d4, :e4, :c4]
for note in notes
  play note
  sleep 0.5
end

# Loop array indexes
notes = [:c4, :d4, :e4, :c4]
notes.length.times do |x|
  play notes[x]
  sleep 0.5
end


## EXERCISE: Exercise: Loop over an array and use a condition
notes = [:c4, :d4, :e4, :c4]
notes.length.times do |x|
  if notes[x] == :d4
    use_synth :fm
  else
    use_synth :beep
  end
  play notes[x]
  if x % 2 == 0
    sleep 0.5
  else
    sleep 0.25
  end
end


### SAMPLES

## Samples Intro
loop do
  sample :loop_breakbeat
  sleep 2
end

## Stretched
loop do
  sample :loop_breakbeat, beat_stretch: 2
  sleep 2
end

## Sleep based on duration
loop do
  sample :loop_breakbeat
  sleep sample_duration(:loop_breakbeat)
end


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


### THREADING AND LIVE LOOPS

## Threaded
in_thread do
  loop do
    sample :loop_compus
    sleep sample_duration(:loop_compus)
  end
end

in_thread do
  loop do
    use_synth :hoover
    play :c4
    sleep sample_duration(:loop_compus)/2
    play :d4
    sleep sample_duration(:loop_compus)/2
  end
end

## Live Loops!

live_loop :wibble do
  sample :ambi_piano, rate: 2
  sleep 2
end


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
  # Pick a sample! Either beat_stretch or use sample_duration
  sample :loop_amen, beat_stretch: 2
  sleep 2
end

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

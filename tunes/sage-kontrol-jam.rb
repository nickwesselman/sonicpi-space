run_file "~/SonicPi/lib/kontrol.rb"

use_synth :hoover

live_loop :synth do
  amp = kontrol.slots[0].slide/127.0
  techno_mix = 0
  techno_mix = 1 if kontrol.slots[0].s.down
  with_fx :ixi_techno, mix: techno_mix do
    with_synth_defaults amp: amp*0.6 do
      play 60
      sleep 0.25
      play 70
      sleep 0.25
      play 79
      sleep 0.25
      play 91
      sleep 0.25
    end
  end
end

live_loop :drums do
  amp = kontrol.slots[1].slide/127.0
  sample :loop_breakbeat, beat_stretch: 1, amp:amp*0.9
  sleep 1
end


live_loop :piano do
  amp = kontrol.slots[2].slide/127.0
  with_synth :piano do
    with_synth_defaults amp: amp*0.9 do
      play 62
      sleep 0.25
      play 72
      sleep 0.25
      play 81
      sleep 0.25
      play 93
      sleep 0.25
    end
  end
end

live_loop :guitar do
  amp = kontrol.slots[3].slide/127.0
  sample :guit_em9, beat_stretch: 8, amp:amp*1.2
  sleep 8
end

live_loop :woosh do
  amp = kontrol.slots[4].slide/127.0
  sample :ambi_dark_woosh, amp:amp*1.2
  sleep sample_duration(:ambi_dark_woosh)
end

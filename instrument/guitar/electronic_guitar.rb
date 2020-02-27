define :play_guitar do |&do_play|
  use_synth :pluck
  use_synth_defaults attack: 0.01, sustain: 0.5, decay: 0.1, release: 0.2, amp: 1, note_slide: 0.25

  with_fx :reverb do
    with_fx :lpf, cutoff: 115 do
      do_play.()
    end
  end
end

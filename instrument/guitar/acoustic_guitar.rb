define :play_guitar do |&do_play|
  use_synth :pluck
  with_fx :reverb do
    with_fx :lpf, cutoff: 115 do
      with_synth :pluck do
        do_play.()
      end
    end
  end
end

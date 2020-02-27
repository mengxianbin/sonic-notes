define :play_piano do |&do_play|
  use_synth :piano
  with_fx :reverb do
    do_play.()
  end
end

use_bpm 100

live_loop :ticks do
  play 0
  sleep 4
end

define :play_ch do |ch|
  play_pattern_timed ch, 0.125
  sleep 3.5
end

live_loop :chord, sync: :ticks do
  use_synth :piano
  with_fx :reverb do
    play_ch chord(:D3, :m7)
    play_ch chord(:G2, "7", invert: 2)
    play_ch chord(:C3, :M7)
    play_ch chord(:C3, "6")
  end
end

live_loop :bass, sync: :ticks do
  sample_rate = (sample_duration :loop_amen) / 4.0
  sample :loop_amen, rate: sample_rate
  sleep 4
end

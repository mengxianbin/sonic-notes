use_bpm 100

live_loop :ticks do
  play_pattern_timed [0], 4
end

# Drum Track
live_loop :beats, sync: :ticks do
  sample_rate = (sample_duration :loop_amen) / 4.0
  sample :loop_amen, rate: sample_rate
  sleep 4
end

define :play_ch do |ch|
  play_pattern_timed ch, 0.0625, attack: 0.2, sustain: 2, release: 2
  sleep 3.75
end

# Piano Track
live_loop :chords, sync: :ticks do
  use_synth :piano
  with_fx :reverb do
    play_ch chord(:D3, :m7)
    play_ch chord(:G2, "7", invert: 2)
    play_ch chord(:C3, :M7)
    play_ch chord(:C3, "6")
  end
end

define :play_bass do |root|
  play_pattern [root]; sleep 0.5
  play_pattern [root]; sleep 1.5
end

# Bass Track
live_loop :bass, sync: :ticks do
  use_synth :fm
  play_bass :F2
  play_bass :G2
  play_bass :C3
  play_bass :A2
end

# Melody Track
live_loop :melody, sync: :ticks do
  play_pattern_timed [0], 1
  play_pattern_timed [(ring :E, :A).tick(:melody)], 0.5
  play_pattern_timed [:G], 0.5
  play_pattern_timed [:G], 0.5
  play_pattern_timed [:E], 0.5
  play_pattern_timed [:E], 1
end

define :play_choir do |root|
  play_pattern_timed [root], 2.5
  play_pattern_timed [root - 2], 0.5
  play_pattern_timed [root], 0.5
  play_pattern_timed [root - 2], 4.5
end

# Choir Track
live_loop :choir, sync: :ticks do
  play_choir :E5
  play_choir :D5
end

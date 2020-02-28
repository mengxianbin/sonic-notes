use_bpm 100

live_loop :ticks do
  play 0
  sleep 4
end

# Drum Track
live_loop :beats, sync: :ticks do
  sample_rate = (sample_duration :loop_amen) / 4.0
  sample :loop_amen, rate: sample_rate
  sleep 4
end

define :play_ch do |ch|
  play_pattern_timed ch, 0.0625, attack: 0.4, sustain: 1, release: 4, amp: 2
  sleep 3.75
end

# Piano Track
live_loop :chord, sync: :ticks do
  use_synth :piano
  with_fx :reverb do
    play_ch chord(:D3, :m7)
    play_ch chord(:G2, "7", invert: 2)
    play_ch chord(:C3, :M7)
    play_ch (ring chord(:C3, "6"), chord(:A2, "7", invert: 1)).tick(:chord)
  end
end

define :play_bass do |root|
  play_pattern_timed [root], 0.5, release: 0.1, amp: 0.6
  play_pattern_timed [root], 0.5, release: 0.1, amp: 0.6
  play_pattern_timed [root], 0.5, release: 0.1, amp: 0.6
  play_pattern_timed [root - 3], 0.25, release: 0.2, amp: 0.5
  play_pattern_timed [root], 0.5, release: 0.2, amp: 0.5
  play_pattern_timed [root], 0.25, release: 0.2, amp: 0.5
  play_pattern_timed [root], 0.25, release: 0.2, amp: 0.5
  play_pattern_timed [root], 0.25, release: 0.2, amp: 0.5
  play_pattern_timed [root + 4], 1, amp: 0.6
end

# Bass Track
live_loop :bass, sync: :ticks do
  use_synth :fm
  play_bass :C3
end

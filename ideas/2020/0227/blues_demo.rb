use_bpm 100

define :play_phrase do |root, template, rhythm|
  offset = root - note(template[0])
  with_fx :reverb do
    play_pattern_timed template.map{|n| n + offset}, rhythm
  end
end

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

define :play_piano do |&do_play|
  use_synth :piano
  with_fx :reverb do
    do_play.()
  end
end

rhythm = [0.5, 0.25]
template = [:C, :C, :E, :E, :G, :G, :A, :A, :Bb, :Bb, :A, :A, :G, :G, :E, :E]
roots = [:C, :C, :F, :C, :G, :F, :C, :C]

live_loop :blues do
  play_blues = -> () { roots.each {|root| play_phrase root, template, rhythm} }
  play_piano &play_blues
  play_guitar &play_blues
end

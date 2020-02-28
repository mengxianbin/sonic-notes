use_bpm 100

rhythm = [0.5, 0.25]
template = [:C, :C, :E, :E, :G, :G, :A, :A, :Bb, :Bb, :A, :A, :G, :G, :E, :E]
roots = [:C, :C, :F, :C, :G, :F, :C, :C]

live_loop :blues do
  # play_phrase: reference from /util/play
  play_blues = ->() { roots.each { |root| play_phrase root, template, rhythm } }
  play_piano &play_blues
  # play_guitar: reference from /instrument/guitar/acoustic_guitar
  play_guitar &play_blues
end

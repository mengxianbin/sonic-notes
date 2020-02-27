use_bpm 60

live_loop :ticks do
  play 0, release: 0
  sleep 1
end

live_loop :melody, sync: :ticks do
  rhythm = [0.33, 0.17, 0.34, 0.16]
  template = [:C, :C, :E, :E, :G, :G, :A, :A, :Bb, :Bb, :A, :A, :G, :G, :E, :E]
  roots = [:C, :C, :F, :C, :G, :F, :C, :C]
  play_piano &->() { roots.each { |root| play_phrase root, template, rhythm } }
end

live_loop :bass, sync: :ticks do
  rhythm = [2, 0.83, 0.17, 1]
  template = [:C, :C, :C, 0]
  roots = [:C, :C, :F, :C, :G, :F, :C, :C].map { |n| n - 24 }
  play_piano &->() { roots.each { |root| play_phrase root, template, rhythm } }
end

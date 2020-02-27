define :play_phrase do |root, template, rhythm|
  offset = root - note(template[0])
  with_fx :reverb do
    play_pattern_timed template.map { |n| n + offset }, rhythm
  end
end

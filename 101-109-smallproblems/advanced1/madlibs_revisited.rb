
NOUNS = %w(dog moon tree sheep)
VERBS = %w(like lick bite)
ADJECTIVES = %w(cool crazy hilarious awesome radical)
ADVERBS = %w(hungrily feverishly)

def replace_first(string, old_substring, new_substring)
  return string if !string.include? old_substring

  i = string.index old_substring
  j = i + old_substring.length
  string[0..(i - 1)] + new_substring + string[j..-1]
end

def replace_all(story, placeholder, collection)
  while story.include? placeholder
    story = replace_first story, placeholder, collection.sample
  end
  story
end

story = File.read('madlibs_input.txt').gsub("\n", "")

story = replace_all story, '<NOUN>', NOUNS
story = replace_all story, '<VERB>', VERBS
story = replace_all story, '<ADJECTIVE>', ADJECTIVES
story = replace_all story, '<ADVERB>', ADVERBS

puts story

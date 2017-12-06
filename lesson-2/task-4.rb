
alphabet = ('a'..'z')
vowels_hash = {}
vowels = %w[a e i o u]

alphabet.each_with_index { |e, i| vowels_hash[e] = i + 1 if vowels.include?(e) }
puts vowels_hash

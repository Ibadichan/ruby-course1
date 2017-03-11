alphabet = ("a" .. "z")
vowels_hash = {}
vowels = %w(a e i o u)
alphabet.each_with_index do |el, index|
   vowels_hash[el] = index + 1 if vowels.include?(el)
end
puts vowels_hash

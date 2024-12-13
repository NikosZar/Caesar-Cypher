require_relative 'english_frequencies'
require_relative 'caesar_cypher'

# Confidence Score
def confidence_score(message)
  case message.length
  when 0..49
    "Very Short message. Low confidence (#{message.length} chars)"
  when 50..99
    "Short message. Medium confidence (#{message.length} chars)"
  else
    "Moderate or longer message. High confidence (#{message.length} chars)"
  end
end

# frequency distribution of encrypted string
def freq_encrypted_message(encrypted_message)
  #1. clean the text - keep only the letters for frequency analysis
  cleaned_message = encrypted_message.downcase.gsub(/[^a-z]/, '')

  #2. frequency of each character in the message
  message_length = cleaned_message.split("").length
  message_arr = cleaned_message.split("").to_a

  #store char counts in hash
  char_count = message_arr.reduce(Hash.new(0)) do |hash, char|
    hash[char] += 1
    hash
  end

  #3. Iterate through hash and calculate proportion
  char_distribution = char_count.transform_values {|value|  value = value/message_length.to_f * 100 }
  char_distribution
end

# Chi-Squared sum(observred - expected)^2 / expected
def compare_frequencies(distribution)
  chi_squared_sum = 0

  # Check all possible letters in English frequency table
  ENGLISH_FREQUENCIES.each do |letter, expected_freq|
    observed_freq = distribution[letter] || 0
    chi_squared_sum += ((observed_freq - expected_freq)**2) / expected_freq
  end

  chi_squared_sum.round(2)
end

# Find the best shift (minimize chi-squared)
def find_best_shift(encrypted_message)
  best_shift = 0
  lowest_chi_squared = Float::INFINITY

  (0..25).each do |shift|
    decrypted_attempt = caesar_cypher(encrypted_message, 26-shift)
    frequencies = freq_encrypted_message(decrypted_attempt)
    chi_squared = compare_frequencies(frequencies)

    if chi_squared < lowest_chi_squared
      lowest_chi_squared = chi_squared
      best_shift = shift
    end
  end

  {
    shift: best_shift,
    confidence: confidence_score(encrypted_message)
  }
end

if ARGV.length != 1
  puts "Usage: ruby caesar_cypher_decoder.rb \"encrypted text\""
  exit
end

encrypted_text = ARGV[0]
result = find_best_shift(encrypted_text)
decrypted = caesar_cypher(encrypted_text, 26-result[:shift])

puts "Detected shift: #{result[:shift]}"
puts "#{result[:confidence]}"
puts "Decrypted text: #{decrypted}"

#Pseudocode
# Method that intakes the encrypted message (if message empty, return empty or error)
# Method analyzes the frequencies distribution of letters in the message
# Method determines the most likely shift value
# Method outputs the decrypted message
# Include appropriate error handling and input validation
#
# Hint:
# What mathematical operations could help measure the distance between two frequency distributions?
# How will I handle case-sensitivity? Non-alphabetic characters?
# How will I handle very short messages where frequency analysis might be less reliable
#
# Future:
# Implement multiple statistical methods and compare their effectiveness
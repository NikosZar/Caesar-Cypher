def caesar_cypher(string, shift)
  string.chars.map do |char|
    case char
    when ('a'..'z') then (((char.ord - 'a'.ord  - shift.to_i) % 26) + 'a'.ord).chr
    when ('A'..'Z') then (((char.ord - 'A'.ord  - shift.to_i) % 26) + 'A'.ord).chr
    else char
    end
  end.join
end

# Only run this if caesar_cypher.rb is the main program
if __FILE__ == $PROGRAM_NAME
  if ARGV.length != 2
    puts 'Usage: ruby caesar_cypher.rb "your text" shift_number'
    puts 'Example: ruby caesar_cypher.rb "hello world" 3'
    exit
  end

  text = ARGV[0]
  shift = ARGV[1].to_i

  puts caesar_cypher(text, shift)
end

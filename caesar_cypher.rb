def caesar_cypher(string, left_shift_value)
   string.chars.map do |char|
    case char
      when ('a'..'z') then ((char.ord - 'a'.ord  - left_shift_value) % 26 + 'a'.ord).chr
      when ('A'..'Z') then ((char.ord - 'A'.ord  - left_shift_value) % 26 + 'A'.ord).chr
      else char
    end
  end.join
end

## Example ##
# p caesar_cypher("Hello there Obi-Wan!", 7)
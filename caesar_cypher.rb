#right shift
alphabet_lowercase = ('a'..'z').to_a
alphabet_uppercase = ('A'..'Z').to_a

def caesar_cypher(string, right_shift_value)
  shift_value = right_shift_value.to_i
  split_string = string.split("")


end

#Pseudocode
#1 - turn the right_shift_value into an integer
#2 - split the string into its characters, preserving capitalizations
#3 - abs(26 - (26 - right_shift_value)) = the new letter index. Think about this one
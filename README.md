# Caesar Cipher

A Ruby implementation of the classic Caesar Cipher encryption technique. This program shifts each letter in a message by a specified number of positions to create a simple encrypted message.

## 🔍 Description

The Caesar Cipher is one of the simplest and most widely known encryption techniques. It works by shifting each letter in the plaintext by a fixed number of positions down the alphabet. For example, with a shift of 1, 'A' would be replaced by 'B', 'B' would become 'C', and so on.

### Features
- Right shift encryption
- Preserves case (uppercase/lowercase)
- Maintains spacing and punctuation
- Handles wrap-around (z → a)
- Processes any positive integer shift factor

## 🚀 Usage


## 💻 Installation

1. Clone this repository:
2. Navigate to the project directory:
3. Run the program:

   
## 🛠️ Technical Details

The cipher follows these rules:
- Shifts letters based on their position in the alphabet (A=0, B=1, etc.)
- Preserves the case of each letter
- Ignores non-alphabetic characters
- Handles shifts greater than 26 by wrapping around

## 📚 Examples

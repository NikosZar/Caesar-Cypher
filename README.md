# Caesar Cipher

A Ruby implementation of the classic Caesar Cipher encryption technique. This program shifts each character in a message to the left by a specified number of positions to create a simple encrypted message.

## 🔍 Description

The Caesar Cipher is one of the simplest and most widely known encryption techniques. It works by shifting each letter in the plaintext by a fixed number of positions up the alphabet. For example, with a shift of 1, 'A' would be replaced by 'Z', 'B' would become 'A', and so on.

### Features
- Left shift encryption
- Preserves case (uppercase/lowercase)
- Maintains spacing and punctuation
- Handles wrap-around (z → a)
- Processes any positive integer shift factor

## 💻 Installation
1. Clone this repository:
2. Navigate to the project directory:
3. Run the program: ruby caesar_cypher.rb
4. Follow Prompted Instructions

## 🚀 Usage

Usage: =>   ruby caesar_cypher.rb "your text" shift_number  
Example: => ruby caesar_cypher.rb "hello world" 3

## 📚 Examples
Input: => ruby caesar_cypher.rb "May the Force be with you!" 5  
Output: => Rfx ymj Ktwhj gj bnym xtz!  
  
Input: =>  ruby caesar_cypher.rb "zed's dead baby! zed's dead" 20  
Output: => fkj'y jkgj hghe! fkj'y jkgj

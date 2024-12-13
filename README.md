# Caesar Cipher

# Encoder

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


# Decoder

## Description

The decoder is based on a frequency analysis of the english language. Frequencies can vary according to source, in my implementation I used the frequency chart from the Cornell Department of Mathematics: https://pi.math.cornell.edu/~mec/2003-2004/cryptography/subs/frequencies.html  

A frequency-based decoder makes use of the frequency of letters used in the english language. For example:  
- 'E' is the most common letter in English
- 'T', 'A', 'O', 'I', 'N' are also very common
- 'Z', 'Q', 'X' are rare

## Frequency Analysis

The Chi-Square test was used to compare the observed letter frequency with the expected english language letter frequency. Chi-Squared was chosen as a first pass at the Caesar Cypher decoder due to the following reasons:

- Simplicity 
- Well-suited for Caesar Cyphers
- Computationally Efficient

As I expand my knowledge of cryptography I plan to compare statistical methods to get more accurate results (for example, more accurate results with shorter messages).  

Alternative statistical tests that could be used:
- Index of Coincidence
- Bhattacharyya Distance
- Kullback-Leibler Divergence
- Cosine Similarity

### Chi-Square Test

$$\chi^2 = \sum \frac {(O_i - E_i)^2}{E_i}$$  

Where:  
- $$O_i = $$ the observed frequency of letter $$i$$
- $$E_i =$$ the expected frequency of letter $$i$$

## Advantages  
The frequency analysis approach is particularly elegant because:
- It uses mathematical/statistical properties of language
- It works without any prior knowledge of the message

## Limitations

- Frequency analysis becomes more accurate with longer texts. For short messages, other techniques may need to be implemented to improve accuracy, or other methodologies may need to be explored.
- Irregular messages, such as 'ZZZZ', are difficult to decode with a frequency-based methodology.

## Statistical Significance  

I implemented a naive definition of what a 'short message' is. I say 'naive' because I did not derive at this definition from investigating academic resources or cryptological experts, but rather gave a ballpark figure of what the length of a typical phrase, sentence, and paragraph is in the english language. **Very Short** and **Short** encrypted messages were given low-confidence scores. My focus was primarily on increasing accuracy for **Moderate** and longer message lengths.    

### Message Length Categories:
- Very Short: < 50 characters
- Short: 50-100 characters
- Moderate: 100-500 characters
- Long: > 500 characters
  
### For reliable frequency analysis:
- Minimum: 100 characters
- Optimal: 500+ characters
- Statistical confidence: Increases with √n (where n is text length)

## 🚀 Usage

**Usage:** =>   ruby caesar_cypher.rb "caesar_cypher_encrypted_text"  
**Example:** => ruby caesar_cypher.rb "ruby caesar_cypher_decoder.rb "Jxu sxy-igkqhut tyijhyrkjyed yi kiut yd jxu secced sxy-igkqhut juiji" 

## 📚 Examples
**Input:** => ruby caesar_cypher.rb "ruby caesar_cypher_decoder.rb "Jxu sxy-igkqhut tyijhyrkjyed yi kiut yd jxu secced sxy-igkqhut juiji veh weetduii ev vyj ev qd eriuhlut tyijhyrkjyed je q jxuehujysqb edu, jxu ydtufudtudsu ev jme shyjuhyq ev sbqiiyvysqjyed ev gkqbyjqjylu tqjq, qdt yd vydtydw jxu sedvytudsu ydjuhlqb veh uijycqjydw jxu fefkbqjyed ijqdtqht tulyqjyed ev q dehcqb tyijhyrkjyed vhec q iqcfbu ijqdtqht tulyqjyed. Cqdo ejxuh ijqjyijysqb juiji qbie kiu jxyi tyijhyrkjyed, iksx qi Vhyutcqd'i qdqboiyi ev lqhyqdsu ro hqdai."  

**Output:**  
=> Detected shift: 10  
=> Moderate or longer message. High confidence (464 chars)  
=> Decrypted text: The chi-squared distribution is used in the common chi-squared tests for goodness of fit of an observed distribution to a theoretical one, the independence of two criteria of classification of qualitative data, and in finding the confidence interval for estimating the population standard deviation of a normal distribution from a sample standard deviation. Many other statistical tests also use this distribution, such as Friedman's analysis of variance by ranks.

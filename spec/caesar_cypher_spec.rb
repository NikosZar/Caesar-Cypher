require 'spec_helper'
require_relative '../caesar_cypher'

RSpec.describe 'caesar_cypher' do
  it 'returns empty string when given empty string' do
    expect(caesar_cypher("", 5)).to eq("")
  end

  it 'shifts letters by one position' do
    expect(caesar_cypher("abc", 1)).to eq("bcd")
  end

  it 'shifts letters by 5 positions' do
    expect(caesar_cypher("abc", 5)).to eq("fgh")
  end

  it 'wraps from z to a' do
    expect(caesar_cypher("xyz", 3)).to eq("abc")
  end

  it 'preserves capitalization' do
    expect(caesar_cypher("Cab", 2)).to eq("Ecd")
  end

  it 'preserves spaces and punctuation' do
    expect(caesar_cypher("Hello, World!", 1)).to eq("Ifmmp, Xpsme!")
  end

  it 'does not shift punctuation' do
    expect(caesar_cypher("a!?", 2)).to eq("c!?")
  end
end
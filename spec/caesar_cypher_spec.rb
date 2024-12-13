require 'spec_helper'
require_relative '../caesar_cypher'

RSpec.describe 'caesar_cypher' do
  it 'returns empty string when given empty string' do
    expect(caesar_cypher("", 5)).to eq("")
  end

  it 'shifts letters by one position left' do
    expect(caesar_cypher("abc", 1)).to eq("zab")
  end

  it 'shifts letters by 5 positions left' do
    expect(caesar_cypher("abc", 5)).to eq("vwx")
  end

  it 'wraps from a to z' do
    expect(caesar_cypher("abc", 3)).to eq("xyz")
  end

  it 'preserves capitalization' do
    expect(caesar_cypher("Cab", 2)).to eq("Ayz")
  end

  it 'preserves spaces and punctuation' do
    expect(caesar_cypher("Hello, World!", 1)).to eq("Gdkkn, Vnqkc!")
  end

  it 'does not shift punctuation' do
    expect(caesar_cypher("a!?", 2)).to eq("y!?")
  end
end
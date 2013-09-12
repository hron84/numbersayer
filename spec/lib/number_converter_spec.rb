require 'spec_helper'

describe NumberConverter do
  it 'make numbers to respond to_english method' do
    15.should respond_to :to_english
  end

  response_map_uk = {
    1 => 'one',
    5 => 'five',
    10 => 'ten',
    15 => 'fifteen',
    25 => 'twenty-five',
    50 => 'fifty',
    100 => 'one hundred',
    500 => 'five hundred',
    505 => 'five hundred and five',
    515 => 'five hundred and fifteen',
    525 => 'five hundred and twenty-five',
    1000 => 'one thousand',
    5000 => 'five thousand',
    5005 => 'five thousand and five',
    5515 => 'five thousand and five hundred and fifteen',
    5525 => 'five thousand and five hundred and twenty-five',
    55555 => 'fifty-five thousand and five hundred and fifty-five',
    555555 => 'five hundred and fifty-five thousand and five hundred and fifty-five',
    5555555 => 'five million, five hundred and fifty-five thousand and five hundred and fifty-five',
  }

  response_map_us = {
    1 => 'one',
    5 => 'five',
    10 => 'ten',
    15 => 'fifteen',
    25 => 'twenty-five',
    50 => 'fifty',
    100 => 'one hundred',
    500 => 'five hundred',
    505 => 'five hundred five',
    515 => 'five hundred fifteen',
    525 => 'five hundred twenty-five',
    1000 => 'one thousand',
    5000 => 'five thousand',
    5005 => 'five thousand, five',
    5515 => 'five thousand, five hundred fifteen',
    5525 => 'five thousand, five hundred twenty-five',
    55555 => 'fifty-five thousand, five hundred fifty-five',
    555555 => 'five hundred fifty-five thousand, five hundred fifty-five',
    5555555 => 'five million, five hundred fifty-five thousand, five hundred fifty-five',
  }

  context "in UK format" do
    response_map_uk.each_pair do |num,expected|
      it "translates #{num} correctly" do
        expect(num.to_english(true)).to eq(expected)
      end
    end
  end

  context "in US format" do
    response_map_us.each_pair do |num,expected|
      it "translates #{num} correctly" do
        expect(num.to_english(false)).to eq(expected)
      end
    end
  end
end

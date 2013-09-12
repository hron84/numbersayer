module NumberConverter
  
  NAMEMAP = {
    0 => 'zero',
    1 => 'one',
    2 => 'two',
    3 => 'three',
    4 => 'four',
    5 => 'five',
    6 => 'six',
    7 => 'seven',
    8 => 'eight',
    9 => 'nine',
    10 => 'ten',
    11 => 'eleven',
    12 => 'twelve',
    13 => 'thirteen',
    14 => 'fourteen',
    15 => 'fifteen',
    16 => 'sixteen',
    17 => 'seventeen',
    18 => 'eighteen',
    19 => 'nineteen',
    20 => 'twenty',
    30 => 'thirty',
    40 => 'fourty',
    50 => 'fifty',
    60 => 'sixty',
    70 => 'seventy',
    80 => 'eighty',
    90 => 'ninety',
    100 => 'hundred',
    1000 => 'thousand',
    1000_000 => 'million'
  }

  TENS = (0..90).find_all { |i| i % 10 == 0 }
  
  module InstanceMethods
    def to_english(add_and = false)
      # Boost: return early if number is less than 1000
      if self < 1000
        return convert_to_english(self, add_and)
      end

      ## FIXME Currently we support numbers up to 999 999 999
      
      numstr = ""
      num = self

      # FIXME refactor this duplicated code?

      # Millions
      if num >= 1000_000
        low = num % 1000_000
        high = (num - low) / 1000_000
        numstr << "#{high.to_english(add_and)} million, "
        num = low
      end

      # Thousands
      if num >= 1000
        low = num % 1000
        high = (num - low) / 1000
        numstr << "#{high.to_english(add_and)} thousand" 
        if low > 0
          numstr << (add_and ? " and " : ", ")
          numstr << "#{low.to_english(add_and)}"
        end
      end

      return numstr
    end

    private
    
    # Lookup for two-sign number name.
    def convert_to_english(num, add_and = false)
      
      numparts = []
      hundreds = (num - (num % 100)) / 100
     
      num -= hundreds * 100

      if hundreds > 0
        numparts.push "#{NAMEMAP[hundreds]} hundred"
        numparts.push "and" if add_and
      end

      return numparts.first if num == 0

      tens = TENS.find { |i| num - i < 10 }
      ones = num - tens

      if tens == 10
        ones = num
        tens = 0
      end

      # numparts.push tens > 0 ? "#{NAMEMAP[tens]}-#{NAMEMAP[ones]}" : NAMEMAP[ones]

      tt = [
        tens > 0 ? NAMEMAP[tens] : nil,
        ones > 0 ? NAMEMAP[ones] : nil
      ].compact.join('-')
      
      numparts.push tt

      numparts.join(' ')
    end
  end
end

Fixnum.send :include, NumberConverter::InstanceMethods

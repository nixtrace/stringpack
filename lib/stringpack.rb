class StringPack
  
  # Compress string.
  # Checks if strings is compressable
  # and compresses it. If compressed is
  # smaller than original returns it, otherwise
  # it returns the original string.
  # ('aaabbcc')
  # => ('a3b2c2')
  def compress(input)
    input_string = clean(input)
    # String is not a valid compressable.
    return false unless compress? input_string
    # Start compression.
    compressed = ''
    input_string.scan(/(([a-z])\2*)/) do |occurrences, letter|
      compressed << "#{letter}#{occurrences.length}"
    end
    # Check string optimization.
    if compressed.length < input_string.length
      compressed
    else
      input_string
    end
  end

  # Decompress string.
  # Checks if string is decompressable
  # and decompresses it.
  def decompress(input)
    input_string = clean(input)
    # String is not a valid decompressable.
    return false unless decompress? input_string
    # Start decompression.
    decompressed = ''
    input_string.scan(/([a-z])(\d)/) do |letter, number|
      number.to_i.times do
        decompressed << "#{letter}"
      end
    end
    decompressed
  end

  # Check if input can be compressed.
  # A compressable string is a string
  # composed by only lowercase letters,
  # excluding numbers and special characters.
  # ('aaabbcc')
  # => true | false
  def compress?(input)
    if /^[a-z]+$/ =~ clean(input)
      return true
    else
      return false
    end
  end

  # Check if input can be decompressed.
  # A decompressable string is a string
  # composed only by a strict sequence of
  # a letter and a digit, like a4b5
  # ('a3b5c6')
  # => true | false
  def decompress?(input)
    if /^([a-z]\d)+$/ =~ clean(input)
      return true
    else
      return false
    end
  end

  private

  # Converts input to string and strips
  # whitespaces.
  # (' abcd ')
  # => 'abcd'
  def clean(input)
    input.to_s.strip
  end

end
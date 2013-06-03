require 'minitest/autorun'
require 'minitest/pride'

require 'stringpack'

describe 'StringPack' do

  before do
    @stringpack = StringPack.new
  end

  it 'can be created without parameters' do
    @stringpack.must_be_instance_of StringPack
  end

  describe 'when asked if string can be compressed' do
    it 'returns true if string has only lowercase letters' do
      @stringpack.compress?('aabbcc').must_equal true
    end
    it 'returns false if string has digits, symbols or capital letters' do
      @stringpack.compress?('aa1#@.%defcAD').must_equal false
    end
  end

  describe 'when asked if string can be decompressed' do
    it 'returns true if string is a strict sequence of letters and digits' do
      @stringpack.decompress?('d3c4f5').must_equal true
    end
    it 'returns false if string is not a strict sequence of letters and digits' do
      @stringpack.decompress?('d3f55').must_equal false
      @stringpack.decompress?('55555').must_equal false
      @stringpack.decompress?('aaabbcc').must_equal false
      @stringpack.decompress?('#$444vv').must_equal false
    end
  end

  describe 'when compress string' do
    it 'returns compressed string when compressed is smaller than original' do
      @stringpack.compress('aaaabbcc').must_equal 'a4b2c2'
    end
    it 'returns original string when compressed is not smaller than original' do
      @stringpack.compress('aabbcc').must_equal 'aabbcc'
    end
    it 'returns false when original string is not valid' do
      @stringpack.compress('a3b4d').must_equal false
    end
  end

  describe 'when decompress string' do
    it 'returns decompressed string when string is decompressable' do
      @stringpack.decompress('a4b2c2').must_equal 'aaaabbcc'
    end
    it 'returns false when original string is not valid' do
      @stringpack.decompress('aaaabbcc').must_equal false
    end
  end

end
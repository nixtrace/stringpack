require_relative 'lib/stringpack.rb'

stringpack = StringPack.new
p 'Compressing aaaabbcc...'
p stringpack.compress('aaaabbcc')
p 'Decompressing a4b2c2...'
p stringpack.decompress('a4b2c2')
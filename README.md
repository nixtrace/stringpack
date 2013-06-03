# StringPack.
A smart string compressor.
Returns a compressed string from a lowercase only characters sequence, only if compressed string is smaller.
It's able to decompress the compressed string too.
TDDed using MiniTest::Spec.

## Examples:
```rb
stringpack = StringPack.new
p stringpack.compress('aaaabbcc')
# => 'a4b2c2'
p stringpack.decompress('a4b2c2')
# => 'aaaabbcc'
```

## Setup.
- Clone the project and install dependencies:

```sh
$ git clone git://github.com/badshark/stringpack.git
$ cd stringpack
$ bundle install
```

- Run it:

```sh
$ bundle exec ruby run.rb
```

- Test it:

```sh
$ bundle exec rake test
```
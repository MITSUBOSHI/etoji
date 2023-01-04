# Etoji

[![test](https://github.com/MITSUBOSHI/etoji/actions/workflows/test.yml/badge.svg)](https://github.com/MITSUBOSHI/etoji/actions/workflows/test.yml)


Simple 干支(eto) library

## Usage

```ruby
require 'etoji'
Etoji.geto(year: 2023)

# => #<data Etoji::Jyunishi::Animal
#  number=4,
#  emoji="🐰",
#  character="卯",
#  character_hiragana="う",
#  animal_name_ja="兎",
#  animal_name_ja_hiragana="うさぎ",
#  animal_name_en="rabbit">
```

```ruby
require 'etoji'
Etoji.geto_full_string(year: 2023)
# => "癸卯"
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

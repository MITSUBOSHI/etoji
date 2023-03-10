# Etoji

[![test](https://github.com/MITSUBOSHI/etoji/actions/workflows/test.yml/badge.svg)](https://github.com/MITSUBOSHI/etoji/actions/workflows/test.yml)[![typecheck](https://github.com/MITSUBOSHI/etoji/actions/workflows/typecheck.yml/badge.svg)](https://github.com/MITSUBOSHI/etoji/actions/workflows/typecheck.yml)


Simple εΉ²ζ―(eto) library

## Usage

```ruby
require 'etoji'
Etoji.geto(year: 2023)

# => #<data Etoji::Jyunishi::Animal
#  number=4,
#  emoji="π°",
#  character="ε―",
#  character_hiragana_kun="γ",
#  character_hiragana_on="γΌγ",
#  animal_name_ja="ε",
#  animal_name_ja_hiragana="γγγ",
#  animal_name_en="rabbit">
```

```ruby
require 'etoji'
Etoji.geto_full_string(year: 2023)
# => "ηΈε―"
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

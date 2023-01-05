# frozen_string_literal: true

require_relative "etoji/version"
require_relative "etoji/jikkan"
require_relative "etoji/jyunishi"

module Etoji
  class Error < StandardError; end

  def self.geto(year:, with_prev: false, with_next: false)
    year_int = self.convert_year(year)

    jyunishi_number = ((year_int + 8) % 12 + 1)
    current_animal = ::Etoji::Jyunishi.find_by_number(jyunishi_number)

    case [with_prev, with_next]
    in [true, true]
      prev_animal = ::Etoji.geto(year: year_int - 1)
      next_animal = ::Etoji.geto(year: year_int + 1)
      [prev_animal, current_animal, next_animal]
    in [true, false]
      prev_animal = ::Etoji.geto(year: year_int - 1)
      [prev_animal, current_animal]
    in [false, true]
      next_animal = ::Etoji.geto(year: year_int + 1)
      [current_animal, next_animal]
    else
      current_animal
    end
  end

  def self.geto_full_string(year:)
    year_int = self.convert_year(year)

    jikkan_number = ((year_int + 6) % 10 + 1)
    current_kan = ::Etoji::Jikkan.find_by_number(jikkan_number)
    current_animal = ::Etoji.geto(year: year_int)

    [current_kan.character, current_animal.character].join
  end

  def self.convert_year(year)
    year = Integer(year)
    raise 'Not allowed year is given' unless (1..3000).include?(year)
    year
  rescue => e
    raise ::Etoji::Error.new("Invalid year is given, #{e.message}")
  end
  private_class_method :convert_year
end

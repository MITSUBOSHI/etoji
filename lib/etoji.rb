# frozen_string_literal: true

require "etoji/version"
require "etoji/jikkan"
require "etoji/jyunishi"

module Etoji
  class Error < StandardError; end

  def self.geto(year:, with_prev: false, with_next: false)
    year_int = nil
    begin
      year_int = Integer(year)
    rescue
      raise ::Etoji::Error.new("Invalid year is given, #{year}")
    end

    jyunishi_number = (year_int - 3) % 12
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
end

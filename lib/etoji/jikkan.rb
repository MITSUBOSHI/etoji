# frozen_string_literal: true
require 'json'

module Etoji
  module Jikkan
    class NotFound < StandardError; end

    SOURCE_FILE_PATH = File.expand_path('../../../db/jikkan.json', __FILE__)
    Kan = ::Data.define(:number, :character, :character_hiragana_on, :character_hiragana_kun)
    MEMBERS = JSON.parse(File.read(SOURCE_FILE_PATH), symbolize_names: true).map { |attributes|
      Kan.new(
        number: attributes[:number],
        character: attributes[:character],
        character_hiragana_on: attributes[:character_hiragana_on],
        character_hiragana_kun: attributes[:character_hiragana_kun],
      )
    }.freeze

    def self.all
      MEMBERS
    end

    def self.find_by_number(number)
      @kans_by_number ||= MEMBERS.each_with_object({}) { |kan, result| result[kan.number] = kan }
      @kans_by_number[number] or raise NotFound.new("Number: #{number} is not found")
    end
  end
end

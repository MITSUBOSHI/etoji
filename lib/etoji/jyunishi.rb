# frozen_string_literal: true
require 'json'

module Etoji
  module Jyunishi
    class NotFound < StandardError; end
    class Animal < ::Data.define(:number, :emoji, :character, :character_hiragana_kun, :character_hiragana_on, :animal_name_ja, :animal_name_ja_hiragana, :animal_name_en); end

    SOURCE_FILE_PATH = File.expand_path('../../../db/jyunishi.json', __FILE__)
    MEMBERS = JSON.parse(File.read(SOURCE_FILE_PATH), symbolize_names: true).map { |attributes|
      Animal.new(
        number: attributes[:number],
        emoji: attributes[:emoji],
        character: attributes[:character],
        character_hiragana_kun: attributes[:character_hiragana_kun],
        character_hiragana_on: attributes[:character_hiragana_on],
        animal_name_ja: attributes.dig(:animal_name, :ja),
        animal_name_ja_hiragana: attributes.dig(:animal_name, :ja_hiragana),
        animal_name_en: attributes.dig(:animal_name, :en)
      )
    }.freeze

    def self.all
      MEMBERS
    end

    def self.find_by_number(number)
      @animals_by_number ||= MEMBERS.each_with_object({}) { |animal, result| result[animal.number] = animal }
      @animals_by_number[number] or raise NotFound.new("Number: #{number} is not found")
    end
  end
end

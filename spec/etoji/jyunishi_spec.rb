# frozen_string_literal: true

RSpec.describe Etoji::Jyunishi do
  describe '.all' do
    it { expect(Etoji::Jyunishi.all.size).to eq 12 }
    it { expect(Etoji::Jyunishi.all.sort_by(&:number).map(&:character)).to eq %w(子 丑 寅 卯 辰 巳 午 未 申 酉 戌 亥) }
  end

  describe '.find_by_number' do
    context "when number is valid" do
      it do
        expect(Etoji::Jyunishi.find_by_number(12)).to eq(
          Etoji::Jyunishi::Animal.new(
            number: 12,
            emoji: "🐗",
            character: "亥",
            character_hiragana: "い",
            animal_name_ja: "猪",
            animal_name_ja_hiragana: "いのしし",
            animal_name_en: "boar"
          )
        )
      end
    end

    context "when number is invalid" do
      it do
        expect { Etoji::Jyunishi.find_by_number(13) }.to raise_error(Etoji::Jyunishi::NotFound)
      end
    end
  end
end

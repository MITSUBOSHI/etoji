# frozen_string_literal: true

RSpec.describe Etoji::Jikkan do
  describe '.all' do
    it { expect(Etoji::Jikkan.all.size).to eq 10 }
    it { expect(Etoji::Jikkan.all.sort_by(&:number).map(&:character)).to eq %w(甲 乙 丙 丁 戊 己 庚 辛 壬 癸) }
  end

  describe '.find_by_number' do
    context "when number is valid" do
      it do
        expect(Etoji::Jikkan.find_by_number(10)).to eq(
          Etoji::Jikkan::Kan.new(
            number: 10,
            character: '癸',
            character_hiragana_on: 'き',
            character_hiragana_kun: 'みずのと',
          )
        )
      end
    end

    context "when number is invalid" do
      it do
        expect { Etoji::Jikkan.find_by_number(11) }.to raise_error(Etoji::Jikkan::NotFound)
      end
    end
  end
end

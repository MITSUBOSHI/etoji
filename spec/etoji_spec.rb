# frozen_string_literal: true

RSpec.describe Etoji do
  describe '.geto' do
    [
      { argument: { year: '2019' }, expected: { prev_emoji: "🐶", current_emoji: "🐗", next_emoji: "🐭" } },
      { argument: { year: '2020' }, expected: { prev_emoji: "🐗", current_emoji: "🐭", next_emoji: "🐮" } },
      { argument: { year: '2023' }, expected: { prev_emoji: "🐯", current_emoji: "🐰", next_emoji: "🐲" } },
    ].each do |test_hash|
      context "when argument is #{test_hash[:argument]}" do
        it do
          result = Etoji.geto(**test_hash[:argument])
          expect(result.class).to eq ::Etoji::Jyunishi::Animal
          expect(result.emoji).to eq test_hash[:expected][:current_emoji]
        end

        context 'when with_prev is true' do
          it do
            argument = test_hash[:argument].merge(with_prev: true)
            result = Etoji.geto(**argument)
            expect(result.class).to eq Array
            expect(result.map(&:emoji)).to eq test_hash[:expected].values_at(:prev_emoji, :current_emoji)
          end
        end

        context 'when with_next is true' do
          it do
            argument = test_hash[:argument].merge(with_next: true)
            result = Etoji.geto(**argument)
            current_number = test_hash.dig(:expected, :number)
            expect(result.map(&:emoji)).to eq test_hash[:expected].values_at(:current_emoji, :next_emoji)
          end
        end

        context 'when both with_prev and with_next are true' do
          it do
            argument = test_hash[:argument].merge(with_prev: true, with_next: true)
            result = Etoji.geto(**argument)
            expect(result.class).to eq Array
            expect(result.map(&:emoji)).to eq test_hash[:expected].values
          end
        end
      end
    end
  end

  describe '.geto_full_string' do
    [
      { argument: { year: '1900' }, expected: '庚子' },
      { argument: { year: '2021' }, expected: '辛丑' },
      { argument: { year: '2022' }, expected: '壬寅' },
      { argument: { year: '2023' }, expected: '癸卯' },
      { argument: { year: '2345' }, expected: '乙丑' },
    ].each do |test_hash|
      context "when argument is #{test_hash[:argument]}" do
        it do
          expect(Etoji.geto_full_string(**test_hash[:argument])).to eq (test_hash[:expected])
        end
      end
    end
  end
end

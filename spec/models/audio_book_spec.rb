require 'rails_helper'

RSpec.describe AudioBook do
  describe 'validations' do
    subject { audio_book.valid? }

    let(:audio_book) { build :audio_book }

    it { is_expected.to be true }

    context 'when duration is missing' do
      let(:audio_book) { build :audio_book, duration: nil }

      it { is_expected.to be false }
    end
  end
end

require 'rails_helper'

RSpec.describe Book do
  describe 'validations' do
    subject { book.valid? }

    let(:book) { build :book }

    it { is_expected.to be true }

    context 'when title is missing' do
      let(:book) { build :book, title: nil }

      it { is_expected.to be false }
    end

    context 'when publication_date is missing' do
      let(:book) { build :book, publication_date: nil }

      it { is_expected.to be false }
    end
  end
end

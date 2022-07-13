require 'rails_helper'

RSpec.describe Author do
  describe 'validations' do
    subject { author.valid? }

    let(:author) { build :author }

    it { is_expected.to be true }

    context 'when first_name is missing' do
      let(:author) { build :author, first_name: nil }

      it { is_expected.to be false }
    end

    context 'when first_name is missing' do
      let(:author) { build :author, last_name: nil }

      it { is_expected.to be false }
    end
  end
end

require 'rails_helper'

RSpec.describe Comment do
  describe 'validations' do
    subject { comment.valid? }

    let(:comment) { build :comment }

    it { is_expected.to be true }

    context 'when nickname is missing' do
      let(:comment) { build :comment, nickname: nil }

      it { is_expected.to be false }
    end

    context 'when content is missing' do
      let(:comment) { build :comment, content: nil }

      it { is_expected.to be false }
    end

    context 'when book is missing' do
      let(:comment) { build :comment, book: nil }

      it { is_expected.to be false }
    end
  end
end

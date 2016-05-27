require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validation' do
    subject { FactoryGirl.create(:event) }

    context 'valid' do
      it { is_expected.to be_valid }
    end

    context 'invalid' do
      describe 'name' do
        it { is_expected.not_to allow_value('a'*51).for(:name) }
        it { is_expected.not_to allow_value('').for(:name) }
      end

      describe 'place' do
        it { is_expected.not_to allow_value('a'*101).for(:place) }
        it { is_expected.not_to allow_value('').for(:place) }
      end

      describe 'content' do
        it { is_expected.not_to allow_value('a'*201).for(:content) }
        it { is_expected.not_to allow_value('').for(:content) }
      end

      describe 'start_time' do
        it { is_expected.not_to allow_value('').for(:start_time) }
      end

      describe 'end_time' do
        it { is_expected.not_to allow_value('').for(:end_time) }
      end

      describe 'start_time_should_be_before_end_time' do
        it 'start_time >= end_time' do
          expect(FactoryGirl.build(:event, start_time: Time.local(2016, 5), end_time: Time.local(2016, 4)).invalid?).to be_truthy
        end
      end
    end
  end
end

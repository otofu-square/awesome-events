require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validation' do
    context 'valid' do
      it 'valid' do
        event = FactoryGirl.create(:event)
        expect(event).to be_valid
      end
    end

    context 'invalid' do
      describe 'name' do
        it 'is too long' do
          expect(FactoryGirl.build(:event, name: 'a'*100).invalid?).to be_truthy
        end

        it 'is blank' do
          expect(FactoryGirl.build(:event, name: '').invalid?).to be_truthy
        end
      end
    end
  end
end

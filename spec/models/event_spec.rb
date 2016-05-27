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
          expect(FactoryGirl.build(:event, name: 'a'*51).invalid?).to be_truthy
        end

        it 'is blank' do
          expect(FactoryGirl.build(:event, name: '').invalid?).to be_truthy
        end
      end

      describe 'place' do
        it 'is too long' do
          expect(FactoryGirl.build(:event, place: 'a'*101).invalid?).to be_truthy
        end

        it 'is blank' do
          expect(FactoryGirl.build(:event, place: '').invalid?).to be_truthy
        end
      end

      describe 'content' do
        it 'is too long' do
          expect(FactoryGirl.build(:event, content: 'a'*201).invalid?).to be_truthy
        end

        it 'is blank' do
          expect(FactoryGirl.build(:event, content: '').invalid?).to be_truthy
        end
      end

      describe 'start_time' do
        it 'is blank' do
          expect(FactoryGirl.build(:event, start_time: '').invalid?).to be_truthy
        end
      end

      describe 'end_time' do
        it 'is blank' do
          expect(FactoryGirl.build(:event, end_time: '').invalid?).to be_truthy
        end
      end

      describe 'start_time_should_be_before_end_time' do
        it 'start_time >= end_time' do
          expect(FactoryGirl.build(:event, start_time: Time.local(2016, 5), end_time: Time.local(2016, 4)).invalid?).to be_truthy    
        end
      end
    end
  end
end

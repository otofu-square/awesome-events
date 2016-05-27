require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validation' do
    context 'valid' do
      it "valid" do
        event = FactoryGirl.create(:event)
        expect(event).to be_valid
      end
    end
  end
end

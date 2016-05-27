require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validation' do
    it "valid" do
      event = Event.new(
        name:       "otofsagdasdgasdgdsagadsgadsgsadllnasdjhlnsadjklfhnklasdjcfnlaksdhflcnkajsdhfnlkadsjhfnlckadshlfkasjhdlnfjaldsfhlsdkjcfladskcfnlakdsjhnfclkasdjhfnlkasdnlkfasdkljhfcnlasdkjhfu",
        place:      "tokyo",
        content:    "content_test",
        start_time: Time.now,
        end_time:   Time.now
      )

      expect(event).to be_valid
    end
  end
end

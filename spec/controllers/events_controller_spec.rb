require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'GET /events/new' do
    before do
      user = User.create(
        provider: 'twitter',
        uid: '12345',
        nickname: 'nickname_test',
        image_url: 'image.jpg'
      )
      session[:user_id] = user.id
      get :new
    end

    it 'ステータスコードが200であること' do
      expect(response.status).to eq 200
    end

    it 'ビューとして new.html.erb が呼ばれること' do
      expect(response).to render_template 'new'
    end

    it '@event に空イベントが格納されていること' do
      expect(controller.instance_variable_get("@event")).to be_a_new(Event)
    end
  end
end

require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'GET /events/new' do
    before do
      get :new
    end

    it 'ステータスコードが200であること' do
      expect(response.status).to eq 200
    end

    it 'ビューとして new.html.erb が呼ばれること' do
      expect(response).to render_template 'new'
    end

    it '@event に空イベントが格納されていること'
  end
end

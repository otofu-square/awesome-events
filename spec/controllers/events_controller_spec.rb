require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'GET /events/new' do
    before { get :new }

    it 'ステータスコードが200であること'

    it 'ビューとして new.html.erb が呼ばれること'

    it '@event に空イベントが格納されていること'
  end
end

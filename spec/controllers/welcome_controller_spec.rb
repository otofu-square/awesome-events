require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe 'GET /events/:id' do
    before { get :index }

    it 'ステータスコードが200であること' do
      expect(response.status).to eq 200
    end

    it 'ビューとして index.html.erb が呼ばれること' do
      expect(response).to render_template 'index'
    end

    context '現在時刻以降に開催予定のイベントが1つ以上存在する場合' do
      it '開催日時が現在時刻以降のイベントが全件表示されること'
      it '開催日時の昇順でイベントが取得できること'
      it '開催日時が現在時刻より前のイベントは表示されないこと'
    end

    context 'すでに終了したイベントしか存在しない、もしくはイベントの登録件数が0件の場合' do
      it '@events が空であること'
      it 'トップページに「現在開催予定のイベントはございません。」と表示されること'
    end
  end
end

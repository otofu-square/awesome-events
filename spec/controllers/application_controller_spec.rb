require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
    before_action :authenticate

    def index
      render text: "This is test page."
    end
  end

  context 'ログインしている状態のとき' do
    before do
      session[:user_id] = 1
      get :index
    end

    it 'コントローラのアクションが呼ばれること' do
      expect(response.body).to have_text 'This is test page.'
    end
  end

  context 'ログインしていない状態のとき' do
    before { get :index }

    it 'トップページにリダイレクトされること' do
      expect(response).to redirect_to root_path
    end

    it 'flashに格納されるメッセージが"ログインしていません"であること' do
      expect(flash[:alert]).to eq 'ログインしてください。'
    end
  end
end

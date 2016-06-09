require 'rails_helper'

shared_examples_for 'authenticate' do
  subject { response }
  before  { session[:user_id] = nil }

  context 'ログインしていないとき' do
    it 'トップページにリダイレクトすること' do
      expect(response).to redirect_to root_path
    end
  end
end

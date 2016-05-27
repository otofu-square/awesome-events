require 'rails_helper'

RSpec.feature "Logins", type: :feature do
  describe 'ユーザがシステムにログインをする' do
    context 'Twitterログインに成功したとき' do
      before do
        visit root_path
        click_link 'Twitterでログイン'
      end

      it 'トップページに遷移すること' do
        expect(page.current_path).to eq root_path
      end

      it '"ログインしました"と表示されること' do
        expect(page).to have_content 'ログインしました'
      end
    end
  end
end

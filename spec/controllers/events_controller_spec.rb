require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  before do
    @user = User.create(
      provider: 'twitter',
      uid: '12345',
      nickname: 'nickname_test',
      image_url: 'image.jpg'
    )
    session[:user_id] = @user.id
  end

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

    it '@event にセッションのユーザIDと紐付く空イベントが格納されていること' do
      expect(assigns(:event)).to be_a_new(Event)
      expect(assigns(:event).owner_id).to eq @user.id
    end
  end

  describe 'POST /events/' do
    before do
      @params = {
        event: {
          name:       'test.name',
          place:      'test.place',
          start_time: Time.local(2015, 1),
          end_time:   Time.local(2016, 1),
          content:    'test.content'
        }
      }
    end

    context '登録成功するとき' do
      before do
        post :create, @params
      end

      it '/event/:作成したイベントID にリダイレクトされること' do
        expect(response).to redirect_to assigns(:event)
      end

      it 'フォーム送信されたデータと、DBに登録されたデータが一致すること' do
        columns = @params[:event].keys
        expect(assigns(:event).attributes.symbolize_keys.slice(*columns)).to eq @params[:event]
      end

      it 'flash[:notice] に「作成しました。」という文字列が格納されていること' do
        expect(flash[:notice]).to eq '作成しました。'
      end
    end

    context '登録失敗するとき' do
      before do
        @params[:event][:start_time] = 'valid_err'
        post :create, @params
      end

      it 'ステータスコードが200であること' do
        expect(response.status).to eq 200
      end

      it 'ビューとして new.html.erb が呼ばれること' do
        expect(response).to render_template(:new)
      end

      it '@eventにエラー情報が格納されていること' do
        expect(assigns(:event).errors.any?).to be_truthy
      end
    end
  end
end

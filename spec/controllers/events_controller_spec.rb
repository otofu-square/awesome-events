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

    it '@event に空イベントが格納されていること' do
      expect(controller.instance_variable_get("@event")).to be_a_new(Event)
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
        expect(response).to redirect_to controller.instance_variable_get("@event")
      end

      it 'フォーム送信されたデータと、DBに登録されたデータが一致すること' do
        columns = @params[:event].keys
        expect(controller.instance_variable_get("@event").attributes.symbolize_keys.slice(*columns)).to eq @params[:event]
      end

      it 'flash[:notice] に 作成しました という文字列が格納されていること'
    end

    context '登録失敗するとき' do
      it 'ステータスコードが200であること'

      it 'ビューとして new.html.erb が呼ばれること'

    end
  end
end

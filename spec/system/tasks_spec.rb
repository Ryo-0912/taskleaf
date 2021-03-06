require 'rails_helper'

#let(:name) { 'dummy' }

describe 'タスク管理機能', type: :system do
   describe '一覧表示機能' do
    before do
      user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com') #ユーザーAを作成しておく
      FactoryBot.create(:task, name: '最初のタスク', user: user_a) #作成者がユーザーAであるタスクを作成しておく
    end

    context 'ユーザーAがログインしているとき' do
      before do
        visit login_path  #ユーザーAでログインする
        fill_in 'メールアドレス', with: 'a@example.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログインする'
      end

      it 'ユーザーAが作成したタスクが表示される' do
         expect(page).to have_content '最初のタスク' #作成済みのタスクの名称が画面上に表示されていることを確認
      end
    end
  end
end


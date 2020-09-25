require 'rails_helper'

RSpec.feature "Sessions", type: :feature do
  before do
    @user = FactoryBot.create(:user)
  end
  scenario 'ログインする' do
    # トップページを開く
    visit login_path
    # ログインフォームにEmailとパスワードを入力する
    fill_in 'Email', with: 'test1@example.com'
    fill_in 'Password', with: 'password'
    # ログインボタンをクリックする
    click_on 'ログインする'
    # ログインに成功したことを検証する
    expect(page).to have_content 'ログインしました。'
  end
end

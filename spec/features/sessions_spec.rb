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

  scenario '投稿する' do
    visit login_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_on 'ログインする'
    click_link '新規登録'
    fill_in "名称", with: 'test'
    click_button "登録する"
    expect(page).to have_content 'Todo「test」を登録しました。'
  end

  scenario 'カテゴリ一覧' do
    visit login_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_on 'ログインする'
    click_link 'カテゴリ一覧'
    expect(page).to have_content 'カテゴリ一覧'
  end
end

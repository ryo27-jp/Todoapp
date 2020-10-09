require 'rails_helper'

RSpec.feature "Sessions", type: :feature do
  let(:user){FactoryBot.create(:user)}
  scenario 'ログインする' do
    sign_in_as user
    expect(page).to have_content 'ログインしました。'
  end

  scenario '投稿する' do
    sign_in_as user
    click_link '新規登録'
    fill_in "名称", with: 'test'
    click_button "登録する"
    expect(page).to have_content 'Todo「test」を登録しました。'
  end

  scenario 'カテゴリ一覧' do
    sign_in_as user
    click_link 'カテゴリ一覧'
    expect(page).to have_content 'カテゴリ一覧'
  end
end

    
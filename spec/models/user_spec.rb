require 'rails_helper'

RSpec.describe User, type: :model do
  it "有効なファクトリをもつ" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "名前がなければ無効" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors.full_messages).to include("名前を入力してください")
  end
  it "emailアドレスがなければ無効" do
    user = FactoryBot.build(:user, email: nil)
    expect(user).not_to be_valid
  end
  it "重複したemailアドレスは無効" do
    user = FactoryBot.create(:user)
    user2 = FactoryBot.build(:user)
    expect(user).to be_valid
    expect(user2).not_to be_valid
  end
end

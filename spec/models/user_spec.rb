require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(
      name: "Aaron",
      email:      "test@example.com",
      password:   "dottle-nouveau-pavilion-tights-furze",
    )
  end
  it "is valid with a first name, and email, and password" do
    user = @user
    expect(user).to be_valid
  end

  it "名前がなければ無効" do
    @user.name = nil
    user = @user
    user.valid?
    expect(user.errors.full_messages).to include("名前を入力してください")
  end
  it "emailアドレスがなければ無効" do
    @user.email = nil
    user = @user
    expect(user).not_to be_valid
  end
  it "重複したemailアドレスは無効" do
    user = User.create(
      name: "taro",
      email: "test@example.com",
      password: "password"
    )
    user2 = @user
    user2.valid?
    expect(user).to be_valid
    expect(user2).not_to be_valid
  end
end

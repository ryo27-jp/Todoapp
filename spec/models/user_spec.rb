require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a first name, last name and email, and password" do
    user = User.new(
      name: "Aaron",
      email:      "tester@example.com",
      password:   "dottle-nouveau-pavilion-tights-furze",
    )
    expect(user).to be_valid
  end
end

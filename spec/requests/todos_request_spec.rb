require 'rails_helper'

RSpec.describe "Todos", type: :request do
  describe "#index" do
    before do
      @user = FactoryBot.create(:user)
    end
  end
    it "正常にレスポンスを返さない" do
      get '/todos'
      expect(response).not_to be_success
    end
end

require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /login" do
    it "render new" do
      get '/login'
      expect(response).to have_http_status(200)
    end

    it "ログインしていなければ/loginへリダイレクトする" do
      get '/users'
      expect(response).to redirect_to '/login'
    end
  end
end
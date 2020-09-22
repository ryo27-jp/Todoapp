module SignIN
  def sign_in
    cookies[:auth_token] = user.auth_token
  end
end
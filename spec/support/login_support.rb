module LoginSupport
  def sign_in_as(user)
    visit login_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_on 'ログインする'
  end
end

RSpec.configure do |config|
  config.include LoginSupport
end

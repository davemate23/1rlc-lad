module FeaturesHelper
  def login_as(user)
    visit login_path

    fill_in 'session_service_no', with: user.email
    fill_in 'session_password', with: user.password
    find("[value='Log in']").click
  end
end

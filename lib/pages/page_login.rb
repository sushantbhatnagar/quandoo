# Secure Area Login Page
class LoginPage < SecureAreaRootPage
  include FigNewton

  page_url FigNewton.login_url

  expected_element_visible(:login_page_header, 30)
  h2(:login_page_header, text: 'Login Page')

  text_field(:username, id: 'username')
  text_field(:password, id: 'password')
  button(:login, class: 'radius')

  def initialize_page
    has_expected_element_visible?
  end

  def valid_credentials(credentials)
    populate_page_with data_for(credentials.to_sym)
  end

  def invalid_credentials(username, password)
    username_element.set username
    password_element.set password
  end
end

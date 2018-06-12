# Login Page
class LoginPage
  include PageObject
  include FigNewton
  include DataMagic

  page_url FigNewton.base_url

  expected_element_visible(:login_page_header, 30)
  h2(:login_page_header, text: 'Login Page')

  text_field(:username, id: 'username')
  text_field(:password, id: 'password')
  button(:login, class: 'radius')

  div(:flash_message, id: 'flash')

  def initialize_page
    has_expected_element_visible?
  end

  def input_credentials(credentials)
    populate_page_with data_for(credentials.to_sym)
  end

end
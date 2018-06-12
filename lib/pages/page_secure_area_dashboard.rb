# Secure Area Page after login - Dashboard
class SecureArea
  include PageObject

  expected_element_visible(:logout, 30)
  link(:logout, class: 'button secondary radius')
  div(:flash_message, id: 'flash')

  def initialize_page
    has_expected_element_visible?
  end
end

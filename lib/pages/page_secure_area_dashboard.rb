# Secure Area Page after login - Dashboard
class SecureArea < SecureAreaRootPage
  expected_element_visible(:logout, 30)
  link(:logout, class: 'button secondary radius')

  def initialize_page
    has_expected_element_visible?
  end
end

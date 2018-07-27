# Hover over Avatars
class HoverPage < SecureAreaRootPage
  include FigNewton

  page_url FigNewton.hover_url

  expected_element_visible(:hover_page_header, 30)
  h3(:hover_page_header, text: 'Hovers')

  images(:avatars, xpath: '//*[@id="content"]/div/div//img')
  h5s(:users, xpath: '//*[@id="content"]/div//h5')

  def initialize_page
    has_expected_element_visible?
  end
end

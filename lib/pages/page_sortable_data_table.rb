# Data Table Page
class DataTablePage < SecureAreaRootPage
  include FigNewton

  page_url FigNewton.data_table_url

  expected_element_visible(:data_table_header, 30)
  h3(:data_table_header, text: 'Data Tables')

  span(:last_name_header, xpath: '//*[@id="table2"]//th[1]/span')
  cells(:last_names, xpath: '//*[@id="table2"]//tr/td[1]')

  def initialize_page
    has_expected_element_visible?
  end

  def last_name_array
    last_names_elements.map { |name| name.text }
  end

  def ascending_sort
    before_sort = last_name_array.sort!
    last_name_header_element.click
    before_sort
  end

  def descending_sort
    before_sort = last_name_array.sort.reverse!
    2.times { last_name_header_element.click }
    before_sort
  end
end

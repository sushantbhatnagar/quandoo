Given(/^I am on the Data Tables page$/) do
  visit(DataTablePage)
end

When(/^I sort the Last Name column in Example_II table in ([^"]*) order$/) do |sort_in|
  @sorted_array_original = sort_in == 'ascending' ? on(DataTablePage).ascending_sort : on(DataTablePage).descending_sort
end

Then(/^I should see the names sorted in (ascending|descending) order successfully$/) do |arg|
  @after_click_sorted_array = on(DataTablePage).last_name_array
  expect(@sorted_array_original).to eql @after_click_sorted_array
end

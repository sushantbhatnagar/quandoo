Given(/^I am on the Data Tables page$/) do
  visit(DataTablePage)
end

When(/^I sort the Last Name column in Example_II table in ([^"]*) order$/) do |sort_in|
  @before_click_sorted_names = sort_in == 'ascending' ? on(DataTablePage).ascending_sort : on(DataTablePage).descending_sort
end

Then(/^I should see the names sorted in (ascending|descending) order successfully$/) do |sorting_type|
  @after_click_sorted_names = on(DataTablePage).last_name_array
  expect(@before_click_sorted_names).to eql @after_click_sorted_names
end

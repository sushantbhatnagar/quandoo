Given(/^I am on the Secure Area Hover page$/) do
  visit(HoverPage)
end

When(/^I hover over all avatars displayed on the page$/) do
  @all_users = []
  on(HoverPage) do |hover_page|
    @all_avatars = hover_page.avatars_elements.map { |avatar| avatar }
    @all_avatars.each do |avatar|
      avatar.hover
       hover_page.users_elements.map { |user| @all_users << user.text }
    end
  end
  @all_users.reject! { |e| e == '' }
end

Then(/^below users text should be displayed on hovering over its respective avatars$/) do |users_names|
  data = users_names.raw
  users = []
  @all_users.each { |each_user| users << each_user.split(': ')[1] }
  data.each { |user| expect(users).to include user.first }
end

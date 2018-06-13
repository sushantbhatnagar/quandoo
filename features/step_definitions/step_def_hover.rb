Given(/^I am on the Secure Area Hover page$/) do
  visit(HoverPage)
end

When(/^I hover over all avatars displayed on the page$/) do
  @users = []
  on(HoverPage) do |hover_page|
    @avatar_array = hover_page.avatars_elements.map { |avatar| avatar }
    @avatar_array.each do |avatar|
      avatar.hover
       on(HoverPage).users_elements.map { |user| @users << user.text }
    end
  end
  @users.reject! { |e| e == '' }
end

Then(/^below users text should be displayed on hovering over its respective avatars$/) do |users_data|
  data = users_data.raw
  users = []
  @users.each { |x| users << x.split(': ')[1] }
  data.each { |user| expect(users).to include user.first }
end

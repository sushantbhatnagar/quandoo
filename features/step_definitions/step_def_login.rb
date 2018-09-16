Given(/^I am on the Secure Area Login page$/) do
  visit(LoginPage)
end

When(/^I input ([^"]*)$/) do |credential_type|
  on(LoginPage).valid_credentials(credential_type.to_sym)
end

And(/^I login$/) do
  on(LoginPage).login
end

Then(/^I should see below success message$/) do |message|
  expect(on(SecureArea).flash_message_element.text).to include message
end

When(/^I input below "([^"]*)" and "([^"]*)"$/) do |username, password|
  on(LoginPage).invalid_credentials(username, password)
end

Then(/^I should see "([^"]*)" preventing me to login$/) do |message|
  expect(on(LoginPage).flash_message_element.text).to include message
end

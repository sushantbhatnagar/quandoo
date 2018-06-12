Given(/^I am on the Secure Area Login page$/) do
  visit(LoginPage)
end

When(/^I login with a ([^"]*) (username|password) and valid (username|password)$/) do |credential_type, username, password|
  on(LoginPage) do |login_page|
    login_page.input_credentials(credential_type)
    login_page.login
  end
end

Then(/^I should be able to login successfully with below success message$/) do |text|
  expect(on(SecureArea).flash_message_element.text).to include text
end

Then(/^I should get below message preventing me to login$/) do |text|
  expect(on(LoginPage).flash_message_element.text).to include text
end
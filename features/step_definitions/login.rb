require 'faker'

Given('that I am on the login page') do
  page_login.load
  page_login.wait_page_load
  screenshot
end

When('I input username and password') do
  @secrets_value = aws_get_secret['user_1']
  page_login.set_username(@secrets_value['username'])
  page_login.set_password(@secrets_value['password'])
  screenshot
end

When('click in button {string}') do |string|
  click_button(string)
  screenshot
end

Then('log-in will be successfully') do
  expect(page).to have_content('Profile')
  page_profile.wait_page_load
  screenshot
end

When('I input username and password invalid') do
  @secrets_value = aws_get_secret['user_2']
  page_login.set_username(@secrets_value['username'])
  page_login.set_password(@secrets_value['password'])
  screenshot
end

Then('return message error on screen') do
  page_login.wait_message_error
  expect(page).to have_content('Invalid username or password!')
  screenshot
end

When('fill fields first name, last name, username and password') do
  @first_name = Faker::Name.first_name
  page_login.set_first_name(@first_name)

  @last_name = Faker::Name.last_name
  page_login.set_last_name(@last_name)

  @user_name = Faker::Internet.username(specifier: @first_name + @last_name, separators: %w(. _ -))
  page_login.set_username(@user_name)

  @password = Faker::Internet.password
  page_login.set_password(@password)

  screenshot
end

When('I click on captcha') do
  page_login.click_in_captcha
  screenshot
end
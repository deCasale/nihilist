Given /^an admin user$/ do
  @user = FactoryGirl.create(:user)
end

When /^I log in with correct credentials$/ do
  login(@user.email, @user.password)
end

When /^I log in with incorrect credentials$/ do
  login(@user.email, 'incorrect password')
end

Then /^I should be notified that I am logged in$/ do
  assert has_content? 'Logged in'
end

Then /^I should (not )?be logged in$/ do |negation|
  assert negation ? !logged_in? : logged_in?
end

def login(email, password)
  visit('/admin')
  fill_in('Email', :with => email)
  fill_in('Password', :with => password)
  click_button('Try it!')
end

def logged_in?
  page.has_content?('Logged in as')
end
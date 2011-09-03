

When /^I submit my chosen username and my email address$/ do
  fill_in 'user_first_name', :with => 'Rich'
  fill_in 'user_last_name', :with => 'Johnson'
  fill_in 'user_email', :with => 'rich@msn.com'
  fill_in 'user_password', :with => 'asdf'
  fill_in 'user_password_confirmation', :with => 'asdf'
  click_button 'user_submit'
end

Given /^there is a user called "([^\"]*)"$/ do |name| 
  Factory(:user, :name => name)
end

Given /^I am logged in$/ do
  fill_in 'user_session_email', :with => 'rich@msn.com'
  fill_in 'user_session_password', :with => 'asdf'
  click_button 'user_session_submit'
end

When /^I submit my "([^"]*)" titled event$/ do |arg1|
  fill_in 'event_name', :with => arg1
  fill_in 'event_event_date', :with => DateTime.now
  fill_in 'event_start_time', :with => "5pm"
  fill_in 'event_end_time', :with => "10pm"
  fill_in 'event_not', :with => "thanks"
  click_button 'event_submit'
end
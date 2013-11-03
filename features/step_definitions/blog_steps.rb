Given /the following users exist:$/ do |table|
  table.hashes.each do |element|
    User.create(element)
  end
end

Given /the following articles exist:$/ do |table|
  table.hashes.each do |element|
    Article.create(element)
  end
end

Given /the following comments exist:$/ do |table|
  table.hashes.each do |element|
    Comment.create(element)
  end
end

Given /I am logged in with username "(.*?)" and password "(.*?)"$/ do |username, password|
  visit '/accounts/login'
  fill_in 'user_login', :with => username
  fill_in 'user_password', :with => password
  click_button 'Login'
  assert page.has_content? 'Login successful'
end

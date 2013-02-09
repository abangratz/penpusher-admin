Then /^I should see "(.*?)"$/ do |arg1|
  page.should have_content("Hi")
end

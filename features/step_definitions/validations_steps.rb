Then /^I should see "(.*?)"$/ do |text|
  page.should have_content(text)
end

Then /^I should not see "(.*?)"$/ do |text|
  page.should_not have_content(text)
end

Then /^I should be on the "(.*?)" page$/ do |path|
  current_path.should eq(path)
end

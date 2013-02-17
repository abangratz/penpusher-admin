Given /^there are no entries in the blog$/ do
  Rails.application.config.blog_admin.entries.clear 
end

Given /^I have a list of articles with the following content:$/ do |table|
  table.hashes.each do |hash|
    visit "/articles/new"
    fill_in("Title", with: hash["title"])
    fill_in("Body", with: hash["body"])
    click_on("Save")
  end
end


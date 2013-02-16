When /^I fill in "(.*?)" with "(.*?)"$/ do |id, value|
  fill_in(id, with: value)
end

When /^I click "(.*?)"$/ do |id|
  click_on(id)
end

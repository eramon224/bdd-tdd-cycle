Given(/^the following movies exist:$/) do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |movie|
      Movie.create(movie)
  end
end

Then(/^the director of "(.*?)" should be "(.*?)"$/) do |title, director|
  assert page.body =~ /#{title}.*Director:\s?#{director}/m
end

When(/^I see the link "(.*?)"$/) do |arg1|
  page.should have_link arg1
end

Then(/^I should see "(.*?)" before "(.*?)"$/) do |arg1, arg2|
  page.body.should =~ /#{arg1}.*#{arg2}/m
end
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
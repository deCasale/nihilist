Given /^there are no comics$/ do
  Comic.all.destroy
end

Given /^I visit the homepage$/ do
  visit '/'
end

Then /^I should see the navigation$/ do
  assert all('#comic-navigation a').size == 5
end

Then /^navigation links should be disabled$/ do
  all('#comic-navigation a').each do |link|
    link.click
    assert current_path == '/'
  end
end

Given /^I have one comic$/ do
  FactoryGirl.create :comic
end

Then /^first and last links should lead to the first comic$/ do
  assert find_link('First')[:href] == comic_path(Comic.first)
  assert find_link('Last')[:href] == comic_path(Comic.last)
end

Then /^random link should lead to some comic$/ do
  click_link 'Random'
  assert current_path != '/'
  assert Comic.where(title: find('#comic-title').text).first.is_a? Comic
  visit '/'
end

Then /^next and previous links should be disabled$/ do
  click_link 'Next'
  assert current_path == '/'
  click_link 'Previous'
  assert current_path == '/'
end

Then /^I should see the last comic$/ do
  assert Comic.last.title == find('#comic-title').text
end

Then /^the first link should lead to the first comic$/ do
  assert find_link('First')[:href] == comic_path(Comic.first)
end

Then /^the last link should lead to the last comic$/ do
  assert find_link('Last')[:href] == comic_path(Comic.last)
end

Then /^random link should be disabled$/ do
  click_link 'Random'
  assert current_path == '/'
end

Then /^I should be able to get to the first comic using the previous button$/ do
  comics = Comic.all.reverse
  comics.each_with_index do |c, i|
    puts "Current index: #{comics.size - i}"
    assert find('#comic-title').text == c.title
    click_link 'Previous'
  end
end

Given /^I visit the first comic$/ do
  visit comic_path(Comic.first)
end

Then /^I should be able to get to the last comic usign the next button$/ do
  Comic.all.entries.each_with_index do |c, i|
    puts "Current index: #{i + 1}"
    assert find('#comic-title').text == c.title
    click_link 'Next'
  end
end
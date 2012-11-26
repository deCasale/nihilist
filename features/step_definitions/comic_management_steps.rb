Given /^I am an admin user$/ do
  @user = FactoryGirl.create(:user)
  login(@user.email, @user.password)
end

When /^I upload a comic$/ do
  upload_comic
end

Then /^the comic should be saved$/ do
  assert Comic.count > 0
end

Then /^I should be redirected to the comic as admin$/ do
  assert current_path == admin_comic_path(Comic.last)
end

When /^I upload a comic (with|without) an image$/ do |with|
  upload_comic(:no_image => with == 'without')
end

Then /^I should (not )?see the image$/ do |negation|
  assert negation ? !has_css?('#comic > img') : has_css?('#comic > img')
end

Given /^I have some comics$/ do
  5.times{FactoryGirl.create(:comic)}
end

Then /^I should see them in the list$/ do
  visit(admin_comics_path)
  assert all('table.comics-list tbody tr').size == 5
end

When /^I remove the comic$/ do
  @deleted_comic_title = Comic.first.title
  visit(admin_comics_path)
  find(:xpath, "//tr[td[contains(.,'#{@deleted_comic_title}')]]/td/a", :text => 'Delete').click
end

Then /^it should not be in the list of comics$/ do
  assert page.all('td', :text => @deleted_comic_title).empty?
end

Then /^the comic should have slug$/ do
  assert !Comic.last.slug.blank?
end

Then /^I should be able to access the comic using the slug$/ do
  assert comic_path(Comic.last) =~ /#{Regexp::escape(Comic.last.slug)}/
end

def upload_comic(options={})
  visit(new_admin_comic_path)
  fill_in('Title', :with => "I am comic number #{Comic.count + 1}")
  unless options[:no_image]
    attach_file('Image', File.expand_path('features/test_files/nighthawk.jpeg'))
  end
  click_button('Create Comic')
end

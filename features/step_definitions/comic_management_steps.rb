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

def upload_comic(options={})
  visit(new_admin_comic_path)
  fill_in('Title', :with => "I am comic number #{Comic.count + 1}")
  unless options[:no_image]
    attach_file('Image', File.expand_path('features/test_files/nighthawk.jpeg'))
  end
  click_button('Create Comic')
end

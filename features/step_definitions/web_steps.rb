When /^(?:|I am )on (.*)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )visit (.*)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )go to (.*)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )press "([^\"]*)"$/ do |button|
  click_button(button)
end

When /^(?:|I )push "([^\"]*)"$/ do |button|
  click_button(button)
end

# http://www.suffix.be/blog/click_image_in_link_capybara
When /^(?:|I )click to image "([^\"]*)"$/ do |image_alt|
  find(:xpath, "//a/img[@alt='#{image_alt}']/..").click
end

When /^(?:|I )follow "([^\"]*)"$/ do |link|
  click_link(link)
end

When /^(?:|I )follow "([^\"]*)" within "([^\"]*)"$/ do |link, parent|
  within(parent) do
    click_link(link)
  end
end

When /^(?:|I )fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I )fill in "([^\"]*)" for "([^\"]*)"$/ do |value, field|
  fill_in(field, :with => value)
end

# Use this to fill in an entire form with data from a table. Example:
#
#   When I fill in the following:
#     | Account Number | 5002       |
#     | Expiry date    | 2009-11-01 |
#     | Note           | Nice guy   |
#     | Wants Email?   |            |
#
# TODO: Add support for checkbox, select or option
# based on naming conventions.
#
When /^(?:|I )fill in the following:$/ do |fields|
  fields.rows_hash.each do |name, value|
    step %{I fill in "#{name}" with "#{value}"}
  end
end

When /^(?:|I )fill in the following within "([^\"]*)":$/ do |parent, fields|
  within(parent) do
    fields.rows_hash.each do |field, value|
      fill_in(field, :with => value)
    end
  end
end

When /^(?:|I )select "([^\"]*)" from "([^\"]*)"$/ do |value, field|
  select(value, :from => field)
end

Then /^(?:|I )should not be redirected to (.*)$/ do |page_name|
  current_path.should_not eql path_to(page_name)
end

Then /^(?:|I )should be redirected to (.*)$/ do |page_name|
  current_path.should eql path_to(page_name)
end

When /^(?:|I )check "([^\"]*)"$/ do |field|
  check(field)
end

When /^(?:|I )uncheck "([^\"]*)"$/ do |field|
  uncheck(field)
end

When /^(?:|I )choose "([^\"]*)"$/ do |field|
  choose(field)
end

When /^(?:|I )attach the file "([^\"]*)" to "([^\"]*)"$/ do |path, field|
  type = path.split(".")[1]

  case type
  when "jpg"
    type = "image/jpg"
  when "jpeg"
    type = "image/jpeg"
  when "png"
    type = "image/png"
  when "gif"
    type = "image/gif"
  end

  attach_file(field, path, type)
end

Then /^(?:|I )should see "([^\"]*)"$/ do |text|
  page.should have_content(text)
end

Then /^(?:|I )should not see "([^\"]*)"$/ do |text|
  page.should_not have_content(text)
end

Then /^(?:|I )should see "([^\"]*)" within "([^\"]*)"$/ do |text, selector|
  within(selector) do
    page.should have_content(text)
  end
end

Then /^(?:|I )should not see "([^\"]*)" within "([^\"]*)"$/ do |text, selector|
  within(selector) do
    page.should have_content(text)
  end
end

Then /^the "([^\"]*)" field should contain "([^\"]*)"$/ do |field, value|
  field_labeled(field).value.should include value
end

Then /^the "([^\"]*)" field should not contain "([^\"]*)"$/ do |field, value|
  field_labeled(field).value.should_not include value
end

Then /^(?:|I )should see an image of "([^\"]*)"/ do |image|
  page.should have_selector(:xpath, '//img[@src="' + image_of(image) + '"]')
end

Then /^(?:|I )should not see an image of "([^\"]*)"/ do |image|
  page.should_not have_selector(:xpath, '//img[@src="' + image_of(image) + '"]')
end

Then /^I should see field "([^"]*)" is "([^"]*)"$/ do |field, value|
  within('div.container dl') do
    page.should have_selector('dt', :text => field)
    page.should have_selector('dd', :text => value)
  end
end


require 'fileutils'

When /^(?:|I )dump page content as "([^"]*)"$/ do |file|
  FileUtils.mkdir_p("log/reports/cucumber/dump")
  File.open("log/reports/cucumber/dump/#{file}", 'w') { |fp| fp.write page.body }
end

Then /^(?:|I )dump content within "([^"]*)"$/ do |selector|
  within(selector) do
    puts Capybara.current_session.send(:current_node).text
  end
end


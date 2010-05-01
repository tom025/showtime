Given /^a movie$/ do
  @movie = Movie.create!
end

When /^I set the showtime to "([^\"]*)" at "([^\"]*)"$/ do |date, time|
  @movie.update_attribute(:showtime_date, Date.parse(date))
  @movie.update_attribute(:showtime_time, time)
end

Then /^the showtime description should be "([^\"]*)"$/ do |showtime|
  @movie.showtime.should == showtime
end

Given /^a genre name Comedy$/ do
  @comedy = Genre.create!(:name => "Comedy")
end

When /^I create a movie Caddyshack in the Comedy genre$/ do
  visit movies_path
  click_link "Add Movie"
  fill_in "Title", :with => "Caddyshack"
  select "1980", :from => "Release Year"
  check "Comedy"
  click_button "Save"
end

Then /^Caddyshack should be in comedy genre$/ do
  pending # express the regexp above with the code you wish you had
end

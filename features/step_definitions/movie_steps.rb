Given /^the following movies:$/ do |movies|
  Movie.create!(movies.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) movie$/ do |pos|
  visit movies_url
  within("table > tbody tr:nth-child(#{pos.to_i})") do
    click_link "Destroy"
  end
end

Then /^I should see the following movies:$/ do |movies|
  movies.rows.each_with_index do |row, i|
    response.should have_selector("tbody tr[#{i+1}] > td:first-child") { |td|
      td.inner_text.should == row[0]
    }
  end
end

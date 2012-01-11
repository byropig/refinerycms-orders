Given /^I have no orders$/ do
  Order.delete_all
end

Given /^I (only )?have orders titled "?([^\"]*)"?$/ do |only, titles|
  Order.delete_all if only
  titles.split(', ').each do |title|
    Order.create(:order_number => title)
  end
end

Then /^I should have ([0-9]+) orders?$/ do |count|
  Order.count.should == count.to_i
end

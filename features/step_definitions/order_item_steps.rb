Given /^I have no order_items$/ do
  OrderItem.delete_all
end

Given /^I (only )?have order_items titled "?([^\"]*)"?$/ do |only, titles|
  OrderItem.delete_all if only
  titles.split(', ').each do |title|
    OrderItem.create(:product_name => title)
  end
end

Then /^I should have ([0-9]+) order_items?$/ do |count|
  OrderItem.count.should == count.to_i
end

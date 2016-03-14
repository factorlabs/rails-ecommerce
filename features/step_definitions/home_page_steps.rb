Given(/^there's a product named "(.*?)" with "(.*?)" description$/) do |name, description|
  @product = FactoryGirl.create(:product, name: name, description: description)
end

When(/^I am on the homepage$/) do
  visit "/products"
end

Then(/^I should see the "(.*?)" product$/) do |name|
  @product = Product.find_by_name(name)

  page.should have_content(@product.name)
  page.should have_content(@product.description)
end
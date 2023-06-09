require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    assign(:items, [
      Item.create!(
        price: "9.99",
        name: "Name",
        description: "MyText",
        image_url: "Image Url"
      ),
      Item.create!(
        price: "9.99",
        name: "Name",
        description: "MyText",
        image_url: "Image Url"
      )
    ])
  end

  it "renders a list of items" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Image Url".to_s), count: 2
  end
end

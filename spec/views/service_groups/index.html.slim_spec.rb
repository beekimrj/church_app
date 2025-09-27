require 'rails_helper'

RSpec.describe "service_groups/index", type: :view do
  before(:each) do
    assign(:service_groups, [
      ServiceGroup.create!(
        name: "Name",
        status: "Status",
        code: "Code"
      ),
      ServiceGroup.create!(
        name: "Name",
        status: "Status",
        code: "Code"
      )
    ])
  end

  it "renders a list of service_groups" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Status".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Code".to_s), count: 2
  end
end

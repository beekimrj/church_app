require 'rails_helper'

RSpec.describe "church_services/index", type: :view do
  before(:each) do
    assign(:church_services, [
      ChurchService.create!(
        name: "Name",
        status: "Status",
        service_group: nil,
        code: "Code"
      ),
      ChurchService.create!(
        name: "Name",
        status: "Status",
        service_group: nil,
        code: "Code"
      )
    ])
  end

  it "renders a list of church_services" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Status".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Code".to_s), count: 2
  end
end

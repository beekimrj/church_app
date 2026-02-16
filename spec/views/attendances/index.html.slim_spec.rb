require 'rails_helper'

RSpec.describe "attendances/index", type: :view do
  before(:each) do
    assign(:attendances, [
      Attendance.create!(
        event: nil,
        status: "Status",
        note: "MyText"
      ),
      Attendance.create!(
        event: nil,
        status: "Status",
        note: "MyText"
      )
    ])
  end

  it "renders a list of attendances" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Status".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end

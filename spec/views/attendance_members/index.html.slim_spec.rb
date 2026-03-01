require 'rails_helper'

RSpec.describe "attendance_members/index", type: :view do
  before(:each) do
    assign(:attendance_members, [
      AttendanceMember.create!(
        member: nil,
        attendance: nil,
        note: "Note"
      ),
      AttendanceMember.create!(
        member: nil,
        attendance: nil,
        note: "Note"
      )
    ])
  end

  it "renders a list of attendance_members" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Note".to_s), count: 2
  end
end

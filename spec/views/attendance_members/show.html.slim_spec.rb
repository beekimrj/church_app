require 'rails_helper'

RSpec.describe "attendance_members/show", type: :view do
  before(:each) do
    assign(:attendance_member, AttendanceMember.create!(
      member: nil,
      attendance: nil,
      note: "Note"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Note/)
  end
end

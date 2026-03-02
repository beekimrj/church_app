require 'rails_helper'

RSpec.describe "attendance_members/edit", type: :view do
  let(:attendance_member) {
    AttendanceMember.create!(
      member: nil,
      attendance: nil,
      note: "MyString"
    )
  }

  before(:each) do
    assign(:attendance_member, attendance_member)
  end

  it "renders the edit attendance_member form" do
    render

    assert_select "form[action=?][method=?]", attendance_member_path(attendance_member), "post" do

      assert_select "input[name=?]", "attendance_member[member_id]"

      assert_select "input[name=?]", "attendance_member[attendance_id]"

      assert_select "input[name=?]", "attendance_member[note]"
    end
  end
end

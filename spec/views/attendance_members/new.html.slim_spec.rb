require 'rails_helper'

RSpec.describe "attendance_members/new", type: :view do
  before(:each) do
    assign(:attendance_member, AttendanceMember.new(
      member: nil,
      attendance: nil,
      note: "MyString"
    ))
  end

  it "renders new attendance_member form" do
    render

    assert_select "form[action=?][method=?]", attendance_members_path, "post" do

      assert_select "input[name=?]", "attendance_member[member_id]"

      assert_select "input[name=?]", "attendance_member[attendance_id]"

      assert_select "input[name=?]", "attendance_member[note]"
    end
  end
end

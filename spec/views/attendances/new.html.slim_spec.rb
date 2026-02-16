require 'rails_helper'

RSpec.describe "attendances/new", type: :view do
  before(:each) do
    assign(:attendance, Attendance.new(
      event: nil,
      status: "MyString",
      note: "MyText"
    ))
  end

  it "renders new attendance form" do
    render

    assert_select "form[action=?][method=?]", attendances_path, "post" do

      assert_select "input[name=?]", "attendance[event_id]"

      assert_select "input[name=?]", "attendance[status]"

      assert_select "textarea[name=?]", "attendance[note]"
    end
  end
end

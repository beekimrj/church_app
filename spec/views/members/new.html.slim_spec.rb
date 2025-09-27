require 'rails_helper'

RSpec.describe "members/new", type: :view do
  before(:each) do
    assign(:member, Member.new(
      first_name: "MyString",
      last_name: "MyString",
      phone_number: "MyString",
      email: "MyString",
      code: "MyString",
      gender: "MyString",
      marital_status: "MyString"
    ))
  end

  it "renders new member form" do
    render

    assert_select "form[action=?][method=?]", members_path, "post" do

      assert_select "input[name=?]", "member[first_name]"

      assert_select "input[name=?]", "member[last_name]"

      assert_select "input[name=?]", "member[phone_number]"

      assert_select "input[name=?]", "member[email]"

      assert_select "input[name=?]", "member[code]"

      assert_select "input[name=?]", "member[gender]"

      assert_select "input[name=?]", "member[marital_status]"
    end
  end
end

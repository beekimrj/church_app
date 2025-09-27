require 'rails_helper'

RSpec.describe "members/index", type: :view do
  before(:each) do
    assign(:members, [
      Member.create!(
        first_name: "First Name",
        last_name: "Last Name",
        phone_number: "Phone Number",
        email: "Email",
        code: "Code",
        gender: "Gender",
        marital_status: "Marital Status"
      ),
      Member.create!(
        first_name: "First Name",
        last_name: "Last Name",
        phone_number: "Phone Number",
        email: "Email",
        code: "Code",
        gender: "Gender",
        marital_status: "Marital Status"
      )
    ])
  end

  it "renders a list of members" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("First Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Last Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Phone Number".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Code".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Gender".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Marital Status".to_s), count: 2
  end
end

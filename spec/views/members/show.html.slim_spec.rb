require 'rails_helper'

RSpec.describe "members/show", type: :view do
  before(:each) do
    assign(:member, Member.create!(
      first_name: "First Name",
      last_name: "Last Name",
      phone_number: "Phone Number",
      email: "Email",
      code: "Code",
      gender: "Gender",
      marital_status: "Marital Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Code/)
    expect(rendered).to match(/Gender/)
    expect(rendered).to match(/Marital Status/)
  end
end

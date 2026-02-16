require 'rails_helper'

RSpec.describe "attendances/show", type: :view do
  before(:each) do
    assign(:attendance, Attendance.create!(
      event: nil,
      status: "Status",
      note: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/MyText/)
  end
end

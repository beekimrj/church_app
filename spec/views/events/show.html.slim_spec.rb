require 'rails_helper'

RSpec.describe "events/show", type: :view do
  before(:each) do
    assign(:event, Event.create!(
      name: "Name",
      status: "Status",
      church_service: nil,
      code: "Code"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Code/)
  end
end

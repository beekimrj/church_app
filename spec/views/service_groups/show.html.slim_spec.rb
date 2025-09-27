require 'rails_helper'

RSpec.describe "service_groups/show", type: :view do
  before(:each) do
    assign(:service_group, ServiceGroup.create!(
      name: "Name",
      status: "Status",
      code: "Code"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/Code/)
  end
end

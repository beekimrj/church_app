require 'rails_helper'

RSpec.describe "church_services/show", type: :view do
  before(:each) do
    assign(:church_service, ChurchService.create!(
      name: "Name",
      status: "Status",
      service_group: nil,
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

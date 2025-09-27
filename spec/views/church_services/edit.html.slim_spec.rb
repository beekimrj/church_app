require 'rails_helper'

RSpec.describe "church_services/edit", type: :view do
  let(:church_service) {
    ChurchService.create!(
      name: "MyString",
      status: "MyString",
      service_group: nil,
      code: "MyString"
    )
  }

  before(:each) do
    assign(:church_service, church_service)
  end

  it "renders the edit church_service form" do
    render

    assert_select "form[action=?][method=?]", church_service_path(church_service), "post" do

      assert_select "input[name=?]", "church_service[name]"

      assert_select "input[name=?]", "church_service[status]"

      assert_select "input[name=?]", "church_service[service_group_id]"

      assert_select "input[name=?]", "church_service[code]"
    end
  end
end

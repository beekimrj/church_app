require 'rails_helper'

RSpec.describe "church_services/new", type: :view do
  before(:each) do
    assign(:church_service, ChurchService.new(
      name: "MyString",
      status: "MyString",
      service_group: nil,
      code: "MyString"
    ))
  end

  it "renders new church_service form" do
    render

    assert_select "form[action=?][method=?]", church_services_path, "post" do

      assert_select "input[name=?]", "church_service[name]"

      assert_select "input[name=?]", "church_service[status]"

      assert_select "input[name=?]", "church_service[service_group_id]"

      assert_select "input[name=?]", "church_service[code]"
    end
  end
end

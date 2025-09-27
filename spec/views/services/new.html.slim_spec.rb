require 'rails_helper'

RSpec.describe "services/new", type: :view do
  before(:each) do
    assign(:service, Service.new(
      name: "MyString",
      status: "MyString",
      service_group: nil,
      code: "MyString"
    ))
  end

  it "renders new service form" do
    render

    assert_select "form[action=?][method=?]", services_path, "post" do

      assert_select "input[name=?]", "service[name]"

      assert_select "input[name=?]", "service[status]"

      assert_select "input[name=?]", "service[service_group_id]"

      assert_select "input[name=?]", "service[code]"
    end
  end
end

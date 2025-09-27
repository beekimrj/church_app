require 'rails_helper'

RSpec.describe "service_groups/new", type: :view do
  before(:each) do
    assign(:service_group, ServiceGroup.new(
      name: "MyString",
      status: "MyString",
      code: "MyString"
    ))
  end

  it "renders new service_group form" do
    render

    assert_select "form[action=?][method=?]", service_groups_path, "post" do

      assert_select "input[name=?]", "service_group[name]"

      assert_select "input[name=?]", "service_group[status]"

      assert_select "input[name=?]", "service_group[code]"
    end
  end
end

require 'rails_helper'

RSpec.describe "service_groups/edit", type: :view do
  let(:service_group) {
    ServiceGroup.create!(
      name: "MyString",
      status: "MyString",
      code: "MyString"
    )
  }

  before(:each) do
    assign(:service_group, service_group)
  end

  it "renders the edit service_group form" do
    render

    assert_select "form[action=?][method=?]", service_group_path(service_group), "post" do

      assert_select "input[name=?]", "service_group[name]"

      assert_select "input[name=?]", "service_group[status]"

      assert_select "input[name=?]", "service_group[code]"
    end
  end
end

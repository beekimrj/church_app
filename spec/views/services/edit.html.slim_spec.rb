require 'rails_helper'

RSpec.describe "services/edit", type: :view do
  let(:service) {
    Service.create!(
      name: "MyString",
      status: "MyString",
      service_group: nil,
      code: "MyString"
    )
  }

  before(:each) do
    assign(:service, service)
  end

  it "renders the edit service form" do
    render

    assert_select "form[action=?][method=?]", service_path(service), "post" do

      assert_select "input[name=?]", "service[name]"

      assert_select "input[name=?]", "service[status]"

      assert_select "input[name=?]", "service[service_group_id]"

      assert_select "input[name=?]", "service[code]"
    end
  end
end

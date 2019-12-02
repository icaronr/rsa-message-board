require 'rails_helper'

RSpec.describe "public_keys/new", type: :view do
  before(:each) do
    assign(:public_key, PublicKey.new(
      :key => "MyString",
      :user => nil
    ))
  end

  it "renders new public_key form" do
    render

    assert_select "form[action=?][method=?]", public_keys_path, "post" do

      assert_select "input[name=?]", "public_key[key]"

      assert_select "input[name=?]", "public_key[user_id]"
    end
  end
end

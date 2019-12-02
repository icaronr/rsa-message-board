require 'rails_helper'

RSpec.describe "public_keys/edit", type: :view do
  before(:each) do
    @public_key = assign(:public_key, PublicKey.create!(
      :key => "MyString",
      :user => nil
    ))
  end

  it "renders the edit public_key form" do
    render

    assert_select "form[action=?][method=?]", public_key_path(@public_key), "post" do

      assert_select "input[name=?]", "public_key[key]"

      assert_select "input[name=?]", "public_key[user_id]"
    end
  end
end

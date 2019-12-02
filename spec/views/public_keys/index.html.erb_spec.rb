require 'rails_helper'

RSpec.describe "public_keys/index", type: :view do
  before(:each) do
    assign(:public_keys, [
      PublicKey.create!(
        :key => "Key",
        :user => nil
      ),
      PublicKey.create!(
        :key => "Key",
        :user => nil
      )
    ])
  end

  it "renders a list of public_keys" do
    render
    assert_select "tr>td", :text => "Key".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

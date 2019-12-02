require 'rails_helper'

RSpec.describe "public_keys/show", type: :view do
  before(:each) do
    @public_key = assign(:public_key, PublicKey.create!(
      :key => "Key",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Key/)
    expect(rendered).to match(//)
  end
end

require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :username => "Username",
        :password_digest => "Password Digest",
        :pub_key => "Pub Key",
        :pvt_key => "Pvt Key"
      ),
      User.create!(
        :username => "Username",
        :password_digest => "Password Digest",
        :pub_key => "Pub Key",
        :pvt_key => "Pvt Key"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 2
    assert_select "tr>td", :text => "Pub Key".to_s, :count => 2
    assert_select "tr>td", :text => "Pvt Key".to_s, :count => 2
  end
end

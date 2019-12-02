require 'rails_helper'

RSpec.describe "messages/index", type: :view do
  before(:each) do
    assign(:messages, [
      Message.create!(
        :ciphertext => "MyText",
        :sender_name => "Sender Name",
        :receiver_name => "Receiver Name"
      ),
      Message.create!(
        :ciphertext => "MyText",
        :sender_name => "Sender Name",
        :receiver_name => "Receiver Name"
      )
    ])
  end

  it "renders a list of messages" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Sender Name".to_s, :count => 2
    assert_select "tr>td", :text => "Receiver Name".to_s, :count => 2
  end
end

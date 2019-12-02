require 'rails_helper'

RSpec.describe "messages/new", type: :view do
  before(:each) do
    assign(:message, Message.new(
      :ciphertext => "MyText",
      :sender_name => "MyString",
      :receiver_name => "MyString"
    ))
  end

  it "renders new message form" do
    render

    assert_select "form[action=?][method=?]", messages_path, "post" do

      assert_select "textarea[name=?]", "message[ciphertext]"

      assert_select "input[name=?]", "message[sender_name]"

      assert_select "input[name=?]", "message[receiver_name]"
    end
  end
end

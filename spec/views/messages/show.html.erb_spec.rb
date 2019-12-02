require 'rails_helper'

RSpec.describe "messages/show", type: :view do
  before(:each) do
    @message = assign(:message, Message.create!(
      :ciphertext => "MyText",
      :sender_name => "Sender Name",
      :receiver_name => "Receiver Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Sender Name/)
    expect(rendered).to match(/Receiver Name/)
  end
end

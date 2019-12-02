require 'rails_helper'

RSpec.describe "PublicKeys", type: :request do
  describe "GET /public_keys" do
    it "works! (now write some real specs)" do
      get public_keys_path
      expect(response).to have_http_status(200)
    end
  end
end

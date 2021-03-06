require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/cats', type: :request do
  let(:json_headers) { { 'ACCEPT' => 'application/json', 'CONTENT_TYPE' => 'application/json' } }
  let!(:described_cat) { create(:cat, score: 1337) }

  describe 'GET /index' do
    it 'renders a successful response' do
      get cats_url
      expect(response).to be_successful
    end
  end

  describe 'POST /upvote' do
    it "increments the Cat's score" do
      post upvote_cat_url(described_cat), headers: json_headers

      expect(response.content_type).to match(%r{application/[^;]*json; charset=utf-8})
      expect(described_cat.reload.score).to eq(1338)
    end
  end

  describe 'POST /downvote' do
    it "increments the Cat's score" do
      post downvote_cat_url(described_cat), headers: json_headers

      expect(response.content_type).to match(%r{application/[^;]*json; charset=utf-8})
      expect(described_cat.reload.score).to eq(1336)
    end
  end
end

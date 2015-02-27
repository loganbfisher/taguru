require 'spec_helper'

describe TagsController, type: :controller do

  describe "GET 'index'" do

    before do
      allow(TagsAdapter).to receive(:get_tags).and_return({})

      get :search
    end

    it "should be successful" do
      expect(response.status).to be 200
    end
  end
end

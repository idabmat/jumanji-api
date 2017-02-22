require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "post #create" do
    context 'with valid params' do
      let(:login_details) { { facebook_token: 'abc123', phone: '1234567890' } }
      let(:params) { { name: 'Foo', logins: login_details } }

      it "returns http success" do
        post :create, params: params, format: :json
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body)['data']['id']).to eq('1')
      end
    end
  end

end

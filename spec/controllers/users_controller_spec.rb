require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "post #create" do
    context 'with valid params' do
      let(:login_details) { { facebook_token: 'abc123', phone: '1234567890' } }
      let(:params) { { name: 'Foo', logins: login_details } }

      it "returns http success" do
        post :create, params: params, format: :json
        expect(response).to have_http_status(:success)
      end

      it "returns the user id" do
        post :create, params: params, format: :json
        expect(JSON.parse(response.body)['data']['id']).to eq('2')
      end
    end

    context 'with invalid params' do
      let(:login_details) { { facebook_token: 'abc123', phone: '1234567890' } }
      let(:params) { { name: '', logins: login_details } }

      it "returns unprocessable entity" do
        post :create, params: params, format: :json
        expect(response).to have_http_status(422)
      end

      it "returns the error message" do
        post :create, params: params, format: :json
        expect(JSON.parse(response.body)['name'][0]).to eq("can't be blank")
      end
    end
  end

end

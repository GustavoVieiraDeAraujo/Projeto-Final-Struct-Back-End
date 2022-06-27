require 'rails_helper'

RSpec.describe "Api::V1::Contacts", type: :request do
  describe "GET /index" do

    context "request index" do
      it "returns http status OK" do
        get "/api/v1/contacts/index"
        expect(response).to have_http_status(:ok)
      end
    end

    context "JSON exists" do  
      it "returns a JSON" do
        get "/api/v1/contacts/index"
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end

  end

  describe "GET /index_pagination" do

    before do 
      create(:contact, id: 999, name:"Contact 1", localization:"Localization 1", email:"teste2022@teste2022.com.br", number:987654321)
    end

    context "page valid" do
      it "returns http status OK" do
        get "/api/v1/contacts/index_pagination/1"
        expect(response).to have_http_status(:ok)
      end
    end

    context "page invalid" do
      it "returns http status bad_request" do
        get "/api/v1/contacts/index_pagination/9999999999999999"
        expect(response).to have_http_status(:bad_request)
      end
    end

    context "JSON exists" do
      it "returns a JSON" do
        get "/api/v1/contacts/index_pagination/1"
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end

  end

  describe "GET /show" do
    let(:contact){create(:contact)}

    context "id valid" do
      let(:contact){create(:contact)}
      it "returns http status OK" do
        get "/api/v1/contacts/show/#{contact.id}"
        expect(response).to have_http_status(:ok)
      end
    end

    context "id invalid" do
      it "returns http status not_found" do
        get "/api/v1/contacts/show/#{contact.id+9999999999}"
        expect(response).to have_http_status(:not_found)
      end
    end

    context "JSON exists" do
      it "returns a JSON" do
        get "/api/v1/contacts/show/#{contact.id}"
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end

  end   
  
  describe "POST /create" do
    let(:administrator) {create(:administrator)}
    let(:contacts_params) do
      {name:"Contact 1", localization:"Localization 1", email:"teste2022@teste2022.com.br", number:987654321}
    end

    context "params are valid" do
      it "returns http status created" do
        post "/api/v1/contacts/create", params: {contact: contacts_params}, headers:{
          "X-Administrator-Email": administrator.email,
          "X-Administrator-Token": administrator.authentication_token
        }
        expect(response).to have_http_status(:created)
      end
    end

    context "params aren't valid" do
      it "returns http status bad_request" do
        contacts_params = nil
        post "/api/v1/contacts/create", params: {contact: contacts_params}, headers:{
          "X-Administrator-Email": administrator.email,
          "X-Administrator-Token": administrator.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
    end

  end

  describe "PATCH /update" do
    let(:administrator) {create(:administrator)}
    let(:contact){create(:contact)}
    let(:contacts_params) do 
      {name:"Contact 1", localization:"Localization 1", email:"teste2022@teste2022.com.br", number:987654321}
    end
    
    context "params are valid" do
      it "returns http status OK" do
        patch "/api/v1/contacts/update/#{contact.id}",params: {contact: contacts_params}, headers:{
          "X-Administrator-Email": administrator.email,
          "X-Administrator-Token": administrator.authentication_token
        }
        expect(response).to have_http_status(:ok)
      end
    end

    context "params aren't valid" do
      it "returns http status unprocessable_entity" do
        contacts_params = nil
        patch "/api/v1/contacts/update/#{contact.id}", params: {contact: contacts_params}, headers:{
          "X-Administrator-Email": administrator.email,
          "X-Administrator-Token": administrator.authentication_token
        }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

  end

  describe "DELETE /delete" do
    let(:administrator) {create(:administrator)}
    let(:contact){create(:contact)}

    context "contact exists" do
      it "returns http status OK" do
        delete "/api/v1/contacts/delete/#{contact.id}", headers:{
          "X-Administrator-Email": administrator.email,
          "X-Administrator-Token": administrator.authentication_token
        }
        expect(response).to have_http_status(:ok)
      end
    end

    context "contact doesn't exist" do
      it "returns http status bad-request" do
        contact.destroy!
        delete "/api/v1/contacts/delete/#{contact.id}", headers:{
          "X-Administrator-Email": administrator.email,
          "X-Administrator-Token": administrator.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

end

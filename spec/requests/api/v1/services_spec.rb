require 'rails_helper'

RSpec.describe "Api::V1::Services", type: :request do
  describe "GET /index" do

    context "request index" do
      it "returns http status OK" do
        get "/api/v1/services/index"
        expect(response).to have_http_status(:ok)
      end
    end

    context "JSON exists" do  
      it "returns a JSON" do
        get "/api/v1/services/index"
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end

  end

  describe "GET /index_pagination" do

    before do
      create(:service, id: 999 , name: "David/Bernador os Salvadores", description:"David/Bernador os Salvadores")
    end

    context "page valid" do
      it "returns http status OK" do
        get "/api/v1/services/index_pagination/1"
        expect(response).to have_http_status(:ok)
      end
    end

    context "page invalid" do
      it "returns http status bad_request" do
        get "/api/v1/services/index_pagination/9999999999999999"
        expect(response).to have_http_status(:bad_request)
      end
    end

    context "JSON exists" do
      it "returns a JSON" do
        get "/api/v1/services/index_pagination/1"
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end

  end

  describe "GET /show" do
    let(:service){create(:service)}

    context "id valid" do
      it "returns http status OK" do
        get "/api/v1/services/show/#{service.id}"
        expect(response).to have_http_status(:ok)
      end
    end

    context "id invalid" do
      it "returns http status not_found" do
        get "/api/v1/services/show/#{service.id+9999999999}"
        expect(response).to have_http_status(:not_found)
      end
    end

    context "JSON exists" do
      it "returns a JSON" do
        get "/api/v1/services/show/#{service.id}"
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end

  end   
  
  describe "POST /create" do
    let(:administrator) {create(:administrator)}
    let(:services_params) do
      {name:"service Test", description:"service Test"}
    end

    context "params are valid" do
      it "returns http status created" do
        post "/api/v1/services/create", params: {service: services_params}, headers:{
          "X-Administrator-Email": administrator.email,
          "X-Administrator-Token": administrator.authentication_token
        }
        expect(response).to have_http_status(:created)
      end
    end

    context "params aren't valid" do
      it "returns http status bad_request" do
        services_params = nil
        post "/api/v1/services/create", params: {service: services_params}, headers:{
          "X-Administrator-Email": administrator.email,
          "X-Administrator-Token": administrator.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
    end

  end

  describe "PATCH /update" do
    let(:administrator) {create(:administrator)}
    let(:service){create(:service)}
    let(:services_params) do
        {name:"service Test", description:"service Test"}
    end
    
    context "params are valid" do
      it "returns http status OK" do
        patch "/api/v1/services/update/#{service.id}",params: {service: services_params}, headers:{
          "X-Administrator-Email": administrator.email,
          "X-Administrator-Token": administrator.authentication_token
        }
        expect(response).to have_http_status(:ok)
      end
    end

    context "params aren't valid" do
      it "returns http status unprocessable_entity" do
        services_params = nil
        patch "/api/v1/services/update/#{service.id}", params:{service: services_params}, headers:{
          "X-Administrator-Email": administrator.email,
          "X-Administrator-Token": administrator.authentication_token
        }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

  end

  describe "DELETE /delete" do
    let(:administrator) {create(:administrator)}
    let(:service){create(:service)}

    context "member exists" do
      it "returns http status OK" do
        delete "/api/v1/services/delete/#{service.id}", headers:{
          "X-Administrator-Email": administrator.email,
          "X-Administrator-Token": administrator.authentication_token
        }
        expect(response).to have_http_status(:ok)
      end
    end

    context "member doesn't exist" do
      it "returns http status bad-request" do
        service.destroy!
        delete "/api/v1/services/delete/#{service.id}", headers:{
          "X-Administrator-Email": administrator.email,
          "X-Administrator-Token": administrator.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
    end
    
  end
end

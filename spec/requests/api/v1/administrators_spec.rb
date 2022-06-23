require 'rails_helper'

RSpec.describe "Api::V1::Administrators", type: :request do

  describe "GET /login" do
    let(:administrator){create(:administrator)}

    context "administrator exists and correct password" do
      it "returns http status OK" do
        get "/api/v1/administrators/login", params: {
          email: administrator.email,
          password: administrator.password
        }
        expect(response).to have_http_status(:ok)
      end
    end

    context "administrator exists and wrong password" do
      it "returns http status unauthorized" do
        get "/api/v1/administrators/login", params: {
          email: administrator.email,
          password: nil
        }
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "administrator doesn't exist" do
      it "returns http status not_found" do
        get "/api/v1/administrators/login", params: {
          email: "vaidarerrado@vaidarerrado.com.br",
          password: nil
        }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "GET /logout" do
    let(:administrator){create(:administrator)}

    context "logout was successful" do
      it "returns http status OK" do
        get "/api/v1/administrators/logout", headers: {
          "X-Administrator-Email": administrator.email,
          "X-Administrator-Token": administrator.authentication_token
        }
        expect(response).to have_http_status(:ok)
      end
    end

    context "logout wasn't successful" do
      it "returns http status bad_request" do
        get "/api/v1/administrators/logout", headers: {
          "X-Administrator-Email": nil,
          "X-Administrator-Token": nil
        }
        expect(response.content_type).to eq("text/html; charset=utf-8")
      end
    end

  end

  describe "GET /index" do

    context "request index" do
      it "returns http status OK" do
        get "/api/v1/administrators/index"
        expect(response).to have_http_status(:ok)
      end
    end

    context "JSON exists" do  
      it "returns a JSON" do
        get "/api/v1/administrators/index"
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end

  end

  describe "GET /show" do
    let(:administrator){create(:administrator)}

    context "id valid" do
      it "returns http status OK" do
        get "/api/v1/administrators/show/#{administrator.id}"
        expect(response).to have_http_status(:ok)
      end
    end

    context "id invalid" do
      it "returns http status not_found" do
        get "/api/v1/administrators/show/#{administrator.id+9999999999}"
        expect(response).to have_http_status(:not_found)
      end
    end

    context "JSON exists" do
      it "returns a JSON" do
        get "/api/v1/administrators/show/#{administrator.id}"
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end

  end   
  
  describe "POST /create" do
    let(:administrator) {create(:administrator)}
    let(:office) {create(:office)}
    let(:administrators_params) do
      {name:"Administrator Test", email: "administrator@administrator.com.br", password:"123456789"}
    end

    context "params are valid" do
      it "returns http status created" do
        post "/api/v1/administrators/create", params: {admin: administrators_params}, headers: {
          "X-Administrator-Email": administrator.email,
          "X-Administrator-Token": administrator.authentication_token 
        }
        expect(response).to have_http_status(:created)
      end
    end

    context "params aren't valid" do
      it "returns http status bad_request" do
        administrators_params = nil
        post "/api/v1/administrators/create", params: {admin: administrators_params}, headers:{
          "X-Administrator-Email": administrator.email,
          "X-Administrator-Token": administrator.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
    end

  end

  describe "PATCH /update" do
    let(:administrator){create(:administrator)}
    let(:administrators_params) do
      {name:"Administrator Test", email:"administrator@administrator.com.br", password:"123456789"}
    end
    
    context "params are valid" do
      it "returns http status OK" do
        patch "/api/v1/administrators/update/#{administrator.id}", params:{admin: administrators_params}, headers:{
          "X-Administrator-Email": administrator.email,
          "X-Administrator-Token": administrator.authentication_token
        }
        expect(response).to have_http_status(:ok)
      end
    end

    context "params aren't valid" do
      it "returns http status unprocessable_entity" do
        administrators_params = nil
        patch "/api/v1/administrators/update/#{administrator.id}", params:{admin: administrators_params}, headers:{
          "X-Administrator-Email": administrator.email,
          "X-Administrator-Token": administrator.authentication_token
        }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

  end

  describe "DELETE /delete" do
    let(:administrator){create(:administrator)}

    context "administrator exists" do
      it "returns http status OK" do
        delete "/api/v1/administrators/delete/#{administrator.id}", headers:{
          "X-Administrator-Email": administrator.email,
          "X-Administrator-Token": administrator.authentication_token
        }
        expect(response).to have_http_status(:ok)
      end
    end

    context "administrator doesn't exist" do
      it "returns http status bad_request" do
        delete "/api/v1/administrators/delete/#{administrator.id+9999999999}", headers:{
          "X-Administrator-Email": administrator.email,
          "X-Administrator-Token": administrator.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
    end
    
  end
end

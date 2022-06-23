require 'rails_helper'

RSpec.describe "Api::V1::Projects", type: :request do
  describe "GET /index" do
    context "request index" do
      it "returns http status OK" do
        get "/api/v1/projects/index"
        expect(response).to have_http_status(:ok)
      end
    end

    context "JSON exists" do  
      it "returns a JSON" do
        get "/api/v1/projects/index"
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end

  end
  
  describe "GET /index_pagination" do
    
    before do
      create(:project, id: 999 , name: "David/Bernador os Salvadores", link:"David/Bernador os Salvadores", description:"David/Bernador os Salvadores")
    end

    context "page valid" do
      it "returns http status OK" do
        get "/api/v1/projects/index_pagination/1"
        expect(response).to have_http_status(:ok)
      end
    end

    context "page invalid" do
      it "returns http status bad_request" do
        get "/api/v1/projects/index_pagination/9999999999999999"
        expect(response).to have_http_status(:bad_request)
      end
    end

    context "JSON exists" do
      it "returns a JSON" do
        get "/api/v1/projects/index_pagination/1"
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end

  end
  
  describe "GET /show" do
    let(:project){create(:project)}

    context "id valid" do
      it "returns http status OK" do
        get "/api/v1/projects/show/#{project.id}"
        expect(response).to have_http_status(:ok)
      end
    end

    context "id invalid" do
      it "returns http status not_found" do
        get "/api/v1/projects/show/#{project.id+9999999999}"
        expect(response).to have_http_status(:not_found)
      end
    end

    context "JSON exists" do
      it "returns a JSON" do
        get "/api/v1/projects/show/#{project.id}"
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end

  end   
    
  describe "POST /create" do
    let(:administrator) {create(:administrator)}
    let(:projects_params) do
      {name:"Project Test", link:"Project Test", description:"Project Test"}
    end

    context "params are valid" do
      it "returns http status created" do
        post "/api/v1/projects/create", params: {project: projects_params}, headers:{
          "X-Administrator-Email": administrator.email,
          "X-Administrator-Token": administrator.authentication_token
        }
        expect(response).to have_http_status(:created)
      end
    end

    context "params aren't valid" do
      it "returns http status bad_request" do
        projects_params = nil
        post "/api/v1/projects/create", params: {project: projects_params}, headers:{
          "X-Administrator-Email": administrator.email,
          "X-Administrator-Token": administrator.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
    end

  end
  
  describe "PATCH /update" do
    let(:administrator) {create(:administrator)}
    let(:project){create(:project)}
    let(:projects_params) do
        {name:"Project Test", link:"Project Test", description:"Project Test"}
    end
    
    context "params are valid" do
      it "returns http status OK" do
        patch "/api/v1/projects/update/#{project.id}",params: {project: projects_params}, headers:{
          "X-Administrator-Email": administrator.email,
          "X-Administrator-Token": administrator.authentication_token
        }
        expect(response).to have_http_status(:ok)
      end
    end

    context "params aren't valid" do
      it "returns http status unprocessable_entity" do
        projects_params = nil
        patch "/api/v1/projects/update/#{project.id}", params:{project: projects_params}, headers:{
          "X-Administrator-Email": administrator.email,
          "X-Administrator-Token": administrator.authentication_token
        }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

  end
  
  describe "DELETE /delete" do
    let(:administrator) {create(:administrator)}
    let(:project){create(:project)}

    context "member exists" do
      it "returns http status OK" do
        delete "/api/v1/projects/delete/#{project.id}", headers:{
          "X-Administrator-Email": administrator.email,
          "X-Administrator-Token": administrator.authentication_token
        }
        expect(response).to have_http_status(:ok)
      end
    end

    context "member doesn't exist" do
      it "returns http status bad-request" do
        project.destroy!
        delete "/api/v1/projects/delete/#{project.id}", headers:{
          "X-Administrator-Email": administrator.email,
          "X-Administrator-Token": administrator.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
    end
    
  end
end

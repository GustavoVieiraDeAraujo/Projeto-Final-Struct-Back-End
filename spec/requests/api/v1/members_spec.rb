require 'rails_helper'

RSpec.describe "Api::V1::Members", type: :request do
  describe "GET /index" do

    context "request index" do
      it "returns http status OK" do
        get "/api/v1/members/index"
        expect(response).to have_http_status(:ok)
      end
    end

    context "JSON exists" do  
      it "returns a JSON" do
        get "/api/v1/members/index"
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end

  end

  describe "GET /index_pagination" do

    before do 
      create(:office, id: 999 , name: "David/Bernador os Salvadores", description:"David/Bernador os Salvadores")
      create(:member, id: 999 , name: "David/Bernador os Salvadores", age: 2022, office_id: 999)
    end

    context "page valid" do
      it "returns http status OK" do
        get "/api/v1/members/index_pagination/1"
        expect(response).to have_http_status(:ok)
      end
    end

    context "page invalid" do
      it "returns http status bad_request" do
        get "/api/v1/members/index_pagination/9999999999999999"
        expect(response).to have_http_status(:bad_request)
        # expect(JSON.parse(response.body)).to eq({"error"=>"Pagina invalida"})
      end
    end

    context "JSON exists" do
      it "returns a JSON" do
        get "/api/v1/members/index_pagination/1"
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end

  end

  describe "GET /show" do
    let(:member){create(:member)}

    context "id valid" do
      let(:member){create(:member)}
      it "returns http status OK" do
        get "/api/v1/members/show/#{member.id}"
        expect(response).to have_http_status(:ok)
      end
    end

    context "id invalid" do
      it "returns http status not_found" do
        get "/api/v1/members/show/#{member.id+9999999999}"
        expect(response).to have_http_status(:not_found)
      end
    end

    context "JSON exists" do
      it "returns a JSON" do
        get "/api/v1/members/show/#{member.id}"
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end

  end   
  
  describe "POST /create" do
    let(:administrator) {create(:administrator)}
    let(:office) {create(:office)}
    let(:members_params) do
      {name:"Membro Teste", age: 2022, office_id: office.id}
    end

    context "params are valid" do
      it "returns http status created" do
        post "/api/v1/members/create", params: {member: members_params}, headers:{
          "X-Administrator-Email": administrator.email,
          "X-Administrator-Token": administrator.authentication_token
        }
        expect(response).to have_http_status(:created)
      end
    end

    context "params aren't valid" do
      it "returns http status bad_request" do
        members_params = nil
        post "/api/v1/members/create", params: {member: members_params}, headers:{
          "X-Administrator-Email": administrator.email,
          "X-Administrator-Token": administrator.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
    end

  end

  describe "PATCH /update" do
    let(:administrator) {create(:administrator)}
    let(:office){create(:office)}
    let(:member){create(:member)}
    let(:members_params) do 
      {name:"Membro Teste", age: 2022, office_id: office.id}
    end
    
    context "params are valid" do
      it "returns http status OK" do
        patch "/api/v1/members/update/#{member.id}",params: {member: members_params}, headers:{
          "X-Administrator-Email": administrator.email,
          "X-Administrator-Token": administrator.authentication_token
        }
        expect(response).to have_http_status(:ok)
      end
    end

    context "params aren't valid" do
      it "returns http status unprocessable_entity" do
        members_params = nil
        patch "/api/v1/members/update/#{member.id}", params: {member: members_params}, headers:{
          "X-Administrator-Email": administrator.email,
          "X-Administrator-Token": administrator.authentication_token
        }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

  end

  describe "DELETE /delete" do
    let(:administrator) {create(:administrator)}
    let(:member){create(:member)}

    context "member exists" do
      it "returns http status OK" do
        delete "/api/v1/members/delete/#{member.id}", headers:{
          "X-Administrator-Email": administrator.email,
          "X-Administrator-Token": administrator.authentication_token
        }
        expect(response).to have_http_status(:ok)
      end
    end

    context "member doesn't exist" do
      it "returns http status bad-request" do
        member.destroy!
        delete "/api/v1/members/delete/#{member.id}", headers:{
          "X-Administrator-Email": administrator.email,
          "X-Administrator-Token": administrator.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
    end
    
  end
end

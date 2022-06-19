class Api::V1::MembersController < ApplicationController

    def index
        members = Member.all
        render json: members, status: :ok
    end

    def index_pagination
        size_page = 5
        members = Member.all.limit(size_page).offset((params[:page].to_i-1)*size_page)
        render json: members, status: :ok
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def show 
        member = Member.find(params[:id])
        render json: member, status: :ok
    rescue StandardError
        head(:not_found)
    end

    def create 
        member = Member.new(members_params)
        member.save!
        render json: member, status: :created
    rescue StandardError => e
        render json: e, status: :bad_request
    end
    
    def update
        member = Member.find(params[:id])
        member.update!(members_params)
        render json: member, status: :ok
    rescue StandardError => e
        render json: e, status: :unprocessable_entity
    end

    def delete
        member = Member.find(params[:id])
        member.destroy!
        render json: {message: "Membro #{member.name} deletado com sucesso"}, status: :ok
    rescue StandardError => e
        render json: e , status: :bad_request
    end

    private

    def members_params 
        params.require(:member).permit(:name, :age, :office_id)
    end
end

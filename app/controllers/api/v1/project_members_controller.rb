class Api::V1::ProjectMembersController < ApplicationController

    # acts_as_token_authentication_handler_for Administrator, only: [:create, :update, :delete]

    def index
        project_members = ProjectMember.all
        render json: project_members, status: :ok
    end

    def index_pagination
        size_page = 5
        project_members = ProjectMember.all.limit(size_page).offset((params[:page].to_i-1)*size_page)
        if project_members.empty?
            return render json: {error: "Pagina invalida"}, status: :bad_request
        else
            return render json: project_members, status: :ok
        end
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def show 
        project_member = ProjectMember.find(params[:id])
        render json: project_member, status: :ok
    rescue StandardError
        head(:not_found)
    end

    def create 
        project_member = ProjectMember.new(projectmembers_params)
        project_member.save!
        render json: project_member, status: :created
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def update
        project_member = ProjectMember.find(params[:id])
        project_member.update!(projectmembers_params )
        render json: project_member, status: :ok
    rescue StandardError => e
        render json: e, status: :unprocessable_entity
    end

    def delete
        project_member = ProjectMember.find(params[:id])
        project_member.destroy!
        render json: {message: "Deleção concluida com sucesso"}, status: :ok
    rescue StandardError => e
        render json: e , status: :bad_request
    end

    private
    
    def projectmembers_params 
        params.require(:project_member).permit(:role, :member_id, :project_id)
    end

end

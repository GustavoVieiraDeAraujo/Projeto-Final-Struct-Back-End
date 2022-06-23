class Api::V1::ProjectsController < ApplicationController

    acts_as_token_authentication_handler_for Administrator, only: [:create, :update, :delete]

    def index
        projects = Project.all
        render json: projects, status: :ok
    end

    def index_pagination
        size_page = 5
        projects = Project.all.limit(size_page).offset((params[:page].to_i-1)*size_page)
        if projects.empty?
            return render json: {error: "Pagina invalida"}, status: :bad_request
        else
            return render json: projects, status: :ok
        end
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def show 
        project = Project.find(params[:id])
        render json: project, status: :ok
    rescue StandardError
        head(:not_found)
    end

    def create 
        project = Project.new(projects_params)
        project.save!
        render json: project, status: :created
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def update
        project = Project.find(params[:id])
        project.update!(projects_params )
        render json: project, status: :ok
    rescue StandardError => e
        render json: e, status: :unprocessable_entity
    end

    def delete
        project = Project.find(params[:id])
        project.destroy!
        render json: {message: "Projeto #{project.name} deletado com sucesso"}, status: :ok
    rescue StandardError => e
        render json: e , status: :bad_request
    end

    private
    
    def projects_params 
        params.require(:project).permit(:name, :link, :description)
    end
end

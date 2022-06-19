class Api::V1::AdministratorsController < ApplicationController
    def index
        admin = Administrator.all
        render json: admin, status: :ok
    end

    def show 
        admin = Administrator.find(params[:id])
        render json: admin, status: :ok
    rescue StandardError
        head(:not_found)
    end

    def create 
        admin = Administrator.new(admin_params)
        admin.save!
        render json: admin, status: :created
    rescue StandardError => e
        render json: e, status: :bad_request
    end
    
    def update
        admin = Administrator.find(params[:id])
        admin.update!(admin_params)
        render json: admin, status: :ok
    rescue StandardError => e
        render json: e, status: :unprocessable_entity
    end

    def delete
        admin = Administrator.find(params[:id])
        admin.destroy!
        render json: {message: "Administrador #{admin.name} deletado com sucesso"}, status: :ok
    rescue StandardError => e
        render json: e , status: :bad_request
    end

    private

    def admin_params 
        params.require(:member).permit(:name, :email)
    end
end

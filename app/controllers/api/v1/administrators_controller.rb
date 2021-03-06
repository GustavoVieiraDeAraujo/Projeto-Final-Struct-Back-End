class Api::V1::AdministratorsController < ApplicationController

    acts_as_token_authentication_handler_for Administrator, only: [:logout, :create, :delete, :update]
    
    def login
        admin = Administrator.find_by!(email: params[:email])
        if admin.valid_password?(params[:password])
            render json: admin, status: :ok
        else 
            head(:unauthorized)
        end
    rescue StandardError => e
        render json: {message: e.message}, status: :not_found
    end

    def logout
        current_administrator.authentication_token = nil
        current_administrator.save!
        render json: {message:"Logout concluido com sucesso"}, status: :ok
    rescue StandardError => e
        render json: {message: e.message }, status: :bad_request
    end

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
        admin = Administrator.create!(admin_params)
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
        params.require(:admin).permit(:name, :email, :password)
    end
end

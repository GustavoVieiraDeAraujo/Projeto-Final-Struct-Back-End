class Api::V1::OfficesController < ApplicationController

    def index
        offices = Office.all
        render json: offices, status: :ok
    end

    def index_pagination
        size_page = 5
        offices = Office.all.limit(size_page).offset((params[:page].to_i-1)*size_page)
        render json: offices, status: :ok
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def show 
        office = Office.find(params[:id])
        render json: office, status: :ok
    rescue StandardError
        head(:not_found)
    end
    
    def create 
        office = Office.new(offices_params)
        office.save!
        render json: office, status: :created
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def update
        office = Office.find(params[:id])
        office.update!(offices_params)
        render json: office, status: :ok
    rescue StandardError => e
        render json: e, status: :unprocessable_entity
    end

    def delete
        office = Office.find(params[:id])
        office.destroy!
        render json: {message: "Cargo #{office.name} deletado com sucesso"}, status: :ok
    rescue StandardError => e
        render json: e , status: :bad_request
    end

    private

    def offices_params 
        params.require(:office).permit(:name, :description)
    end
end

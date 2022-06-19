class Api::V1::PartnershipsController < ApplicationController

    def index
        partnerships = Partnership.all
        render json: partnerships, status: :ok
    end

    def index_pagination
        size_page = 5
        partnerships = Partnership.all.limit(size_page).offset((params[:page].to_i-1)*size_page)
        render json: partnerships, status: :ok
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def show 
        partnership = Partnership.find(params[:id])
        render json: partnership, status: :ok
    rescue StandardError
        head(:not_found)
    end

    def create 
        partnership = Partnership.new(partnerships_params)
        partnership.save!
        render json: partnership, status: :created
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def update
        partnership = Partnership.find(params[:id])
        partnership.update!(partnerships_params)
        render json: partnership, status: :ok
    rescue StandardError => e
        render json: e, status: :unprocessable_entity
    end

    def delete
        partnership = Partnership.find(params[:id])
        partnership.destroy!
        render json: {message: "Parceiro #{partnership.name} deletado com sucesso"}, status: :ok
    rescue StandardError => e
        render json: e , status: :bad_request
    end

    private

    def partnerships_params 
        params.require(:partnership).permit(:name, :link)
    end
end

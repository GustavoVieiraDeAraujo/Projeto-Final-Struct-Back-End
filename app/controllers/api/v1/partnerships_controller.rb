class Api::V1::PartnershipsController < ApplicationController

    acts_as_token_authentication_handler_for Administrator, only: [:create, :update, :delete, :add_images, :delete_all_images]

    def index
        partnerships = Partnership.all
        render json: partnerships, status: :ok
    end

    def index_pagination
        size_page = 5
        partnerships = Partnership.all.limit(size_page).offset((params[:page].to_i-1)*size_page)
        if partnerships.empty?
            return render json: {error: "Pagina invalida"}, status: :bad_request
        else
            return render json: partnerships, status: :ok
        end
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def add_images
        partnership = Partnership.find(params[:id])
        params[:images].each do |image|
            partnership.images.attach(image)
        end
        render json: partnership, status: :ok
    rescue StandardError => e
        render json: {message: e.message}, status: :bad_request
    end

    def delete_all_images
        partnership = Partnership.find(params[:id])
        partnership.images.each do |image|
            partnership.images.purge(image)
        end
        render json: partnership, status: :ok
    rescue StandardError => e
        render json: {message: e.message}, status: :bad_request
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
        params.require(:partnership).permit(:name, :link, images: [])
    end
end

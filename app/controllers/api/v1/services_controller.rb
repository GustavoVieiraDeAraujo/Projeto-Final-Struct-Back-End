class Api::V1::ServicesController < ApplicationController

    acts_as_token_authentication_handler_for Administrator, only: [:create, :update, :delete, :add_images, :delete_all_images]
    
    def index
        services = Service.all
        render json: services, status: :ok
    end

    def index_pagination
        size_page = 5
        services = Service.all.limit(size_page).offset((params[:page].to_i-1)*size_page)
        if services.empty?
            return render json: {error: "Pagina invalida"}, status: :bad_request
        else
            return render json: services, status: :ok
        end
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def add_images
        service = Service.find(params[:id])
        params[:images].each do |image|
            service.images.attach(image)
        end
        render json: service, status: :ok
    rescue StandardError => e
        render json: {message: e.message}, status: :bad_request
    end

    def delete_all_images
        service = Service.find(params[:id])
        service.images.each do |image|
            service.images.purge(image)
        end
        render json: service, status: :ok
    rescue StandardError => e
        render json: {message: e.message}, status: :bad_request
    end

    def show 
        service = Service.find(params[:id])
        render json: service, status: :ok
    rescue StandardError
        head(:not_found)
    end

    def create 
        service = Service.new(services_params)
        service.save!
        render json: service, status: :created
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def update
        service = Service.find(params[:id])
        service.update!(services_params)
        render json: service, status: :ok
    rescue StandardError => e
        render json: e, status: :unprocessable_entity
    end

    def delete
        service = Service.find(params[:id])
        service.destroy!
        render json: {message: "Serviço #{service.name} deletado com sucesso"}, status: :ok
    rescue StandardError => e
        render json: e , status: :bad_request
    end

    private
    
    def services_params 
        params.require(:service).permit(:name, :description, images: [])
    end

end

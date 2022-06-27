class Api::V1::ContactsController < ApplicationController

    acts_as_token_authentication_handler_for Administrator, only: [:create, :update, :delete]

    def index
        contacts = Contact.all
        render json: contacts, status: :ok
    end

    def index_pagination
        size_page = 2
        contacts = Contact.all.limit(size_page).offset((params[:page].to_i - 1)*size_page)
        if contacts.empty?
            return render json: {error: "Pagina invalida"}, status: :bad_request
        else
            return render json: contacts, status: :ok
        end
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def show 
        contact = Contact.find(params[:id])
        render json: contact, status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end

    def create 
        contact = Contact.new(contacts_params)
        contact.save!
        render json: contact, status: :created
    rescue StandardError => e
        render json: e, status: :bad_request
    end
    
    def update
        contact = Contact.find(params[:id])
        contact.update!(contacts_params)
        render json: contact, status: :ok
    rescue StandardError => e
        render json: e, status: :unprocessable_entity
    end

    def delete
        contact = Contact.find(params[:id])
        contact.destroy!
        render json: {message: "Contato #{contact.name} deletado com sucesso"}, status: :ok
    rescue StandardError => e
        render json: e , status: :bad_request
    end

    private

    def contacts_params 
        params.require(:contact).permit(:name, :localization, :email, :number)
    end
end

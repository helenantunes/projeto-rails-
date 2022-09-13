module V2
  class ContactsController < ApplicationController
    before_action :set_contact, only: [:show, :update, :destroy]

    # GET /contacts
    def index

      # if params[:version] == '1'
      #   @contacts = Contact.all
      # elsif params[:version] == '2'
      #   @contacts = Contact.last(5).reverse
      # end
      # >>Funciona mais não é o ideal, o ideal é versionar pelos controllers<<

      @contacts = Contact.last(5).reverse
      render json: @contacts 

      #, include: [:kind]#, include: [:kind, :phones, :address]
      #methods: :author
      #except: [:name, :email]#only: C#root: true #coloque a raiz
    end

    # GET /contacts/1
    def show
      render json: @contact, include: [:kind, :address, :phones] 
      #, meta: {author: "Helena Antunes"} PARA ESTA CHAMADA 
    end

    # POST /contacts
    def create
      @contact = Contact.new(contact_params)

      if @contact.save
        render json: @contact, include: [:kind, :phones, :address], status: :created, location: @contact
      else
        render json: @contact.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /contacts/1
    def update
      if @contact.update(contact_params)
        render json: @contact, include: [:kind, :phones, :address]
      else
        render json: @contact.errors, status: :unprocessable_entity
      end
    end

    # DELETE /contacts/1
    def destroy
      @contact.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_contact
        @contact = Contact.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def contact_params
        # params.require(:contact).permit(
        #   :name, :email, :birthdate, :kind_id,
        #   phones_attributes: [:id, :number, :_destroy], #has_many (plural)
        #   address_attributes: [:id, :street, :city] #has_one (singular)
        #   )
        ActiveModelSerializers::Deserialization.jsonapi_parse(params)
      end
  end
end
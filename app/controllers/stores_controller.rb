class StoresController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_store, only: [:show, :edit, :update, :destroy]


    def index
        @stores = Store.all
    end
    
    def show
    end

    def new
        @store = Store.new
    end

    def create
        @store = Store.new(store_params)         
        if @store.save 
            redirect_to store_path
        else 
            render :new, status: :unprocessable_entity 
         end
    end

    def edit
    end

    def update
        if @store.update(store_params)
            redirect_to @store
        else
            render :edit, status: :unprocessable_entity 
        end
    end

    def destroy
        @store.destroy
        redirect_to root_path        
    end

    private 

    def store_params
        params.require(:store).permit(:name, :address, :phone)
    end

    def set_store
        @store = Store.find(params[:id ])
    rescue ActiveRecord::RecordNotFound
        redirect_to root_path

    end

end
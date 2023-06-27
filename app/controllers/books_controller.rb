class BooksController < ApplicationController
    def index
        @books = BookInventory.all
    end
    
    def show
        @book = BookInventory.find(params[:id ])
    rescue ActiveRecord::RecordNotFound
        redirect_to root_path
    end

    def new
        @book = BookInventory.new
    end
end
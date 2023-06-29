class BooksController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_book, only: [:show, :edit, :update, :destroy]


    def index
        @books = BookInventory.all
    end
    
    def show
    end

    def new
        @book = BookInventory.new
    end

    def create
        @book = BookInventory.new(book_params)         
        if @book.save 
            redirect_to root_path
        else 
            render :new, status: :unprocessable_entity 
         end
    end

    def edit
    end

    def update
        if @book.update(book_params)
            redirect_to @book
        else
            render :edit, status: :unprocessable_entity 
        end
    end

    def destroy
        @book.destroy
        redirect_to root_path        
    end

    private 

    def book_params
        params.require(:book_inventory).permit(:title, :author, :year, :description)
    end

    def set_book
        @book = BookInventory.find(params[:id ])
    rescue ActiveRecord::RecordNotFound
        redirect_to root_path

    end

end
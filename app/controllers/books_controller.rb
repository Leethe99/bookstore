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

    def create
        @book = BookInventory.new(book_params)         
        if @book.save 
            redirect_to root_path
        else 
            render :new, status: :unprocessable_entity 
         end
    end

    def edit
        @book = BookInventory.find(params[:id])        
    end

    def update
        @book = BookInventory.find(params[:id])
        if @book.update(book_params)
            redirect_to @book
        else
            render :edit, status: :unprocessable_entity 
        end
    end

    private 

    def book_params
        params.require(:book_inventory).permit(:title, :author, :year, :description)
    end

end
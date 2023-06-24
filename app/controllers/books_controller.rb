class BooksController < ApplicationController
    def index
        @books = BookInventory.all
    end
end
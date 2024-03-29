class BooksController < ApplicationController

  def new
  end

  def index
    @book=Book.new
    @books=Book.all
    flash[:notice] = "Book was successfully destroyed." 
  end

  def create
    @book = Book.new(book_params)
    if @book.save
     redirect_to book_path(@book.id)
    else
    @books = Book.all
     render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    flash[:notice] = "successfully"
  end

  def edit
     @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id)
    else
    @books = Book.all
     render :show
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end

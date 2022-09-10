class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @categories = Category.all.collect{|category| [category.name, category.id]}
    @book = Book.new
  end

  def create
    book = Book.create!(book_params)
    redirect_to books_path
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path, notice: 'Livro excluído.'
  end

  def edit
    @categories = Category.all.collect{|category| [category.name, category.id]}
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    
    if @book.update(book_params)
      redirect_to edit_book_path(@book), notice: 'Livro atualizado!'
    else
      render :edit
    end
  end
  private

  def book_params
    params.require(:book).permit(:title, :author, :email, :category_id)
  end
end

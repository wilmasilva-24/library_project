class BooksController < ApplicationController
  def index
    if params[:search].present?
      @books = Book.includes(:category).references(:category)
                   .where(
                    "title ILIKE :search_param OR author ILIKE :search_param OR categories.name ILIKE :search_param", 
                    search_param: "%#{params[:search]}%"
                    ).paginate(page: params[:page],per_page: 5)
    else
      @books = Book.includes(:category).paginate(page: params[:page],per_page: 5)
    end
  end

  def new
    @categories = Category.all.collect{|category| [category.name, category.id]}
    @book = Book.new
    authorize :book
  end

  def create
    @book = Book.new(book_params)
    authorize :book
    if @book.save
      redirect_to books_path, notice: 'Livro cadastrado!'
    else
      render :new
    end
  end

  def destroy
    book = Book.find(params[:id])
    authorize book
    book.destroy
    redirect_to books_path, notice: 'Livro excluído.'
  end

  def edit
    @categories = Category.all.collect{|category| [category.name, category.id]}
    @book = Book.find(params[:id])
    authorize @book
  end

  def update
    @book = Book.find(params[:id])
    authorize @book
    
    if @book.update(book_params)
      redirect_to books_path, notice: 'Livro atualizado!'
    else
      render :edit
    end
  end
  private

  def book_params
    params.require(:book).permit(:title, :author, :email, :category_id)
  end
end

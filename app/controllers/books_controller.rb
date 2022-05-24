class BooksController < ApplicationController
   before_action :ensure_current_user, {only: [:edit, :update]}
      def ensure_current_user
        @book = Book.find(params[:id])
        if @book.user.id == current_user.id
        else
          redirect_to books_path
        end
      end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
    @users = User.all
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])

  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:success] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      @users = User.all
      render :index
    end
  end


  def show
    @book = Book.find(params[:id])
    @user = current_user
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end



   private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end

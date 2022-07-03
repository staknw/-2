class BooksController < ApplicationController
# newページ内からdefnewを消す

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      # books=allを新しく定義してあげる
      @books = Book.all
      # renderはindexの中身ない奴に飛ぶ
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    # 保存されているデータが必要だからfindメソッドを使う
    @book = Book.find(params[:id])
  end

  def edit
    # 保存されているデータが必要だからfindメソッドを使う
    @book = Book.find(params[:id])
  end


  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:update] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end


  def destroy
    book = Book.find(params[:id])
    book.destroy
      flash[:destroy] = "Book was successfully destroyed."
      redirect_to books_path
  end



  private
  def book_params
    # booksじゃない
    params.require(:book).permit(:title, :body)
  end
end


class Api::V1::BooksController < ApplicationController
  def index
    books = Book.all
    render json: books
  end

  def create
    book = Book.new(
      title: params[:title],
      author: params[:author],
      genre: params[:genre],
      description: params[:description],
      pages: params[:pages]
    )

    if book.save
      render json: book, status: :created
    else 
      render json: { errors: book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    book = Book.find(params[:id])
    render json: book
  end

  def update
    book = Book.find(params[:id])

    if book.update(
      title: params[:name] || book.title,
      author: params[:author] || book.author,
      genre: params[:genre] || book.genre,
      description: params[:description] || book.description,
      pages: params[:pages] || book.pages
    )
      render json: book
    else
      render json: {errors: book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    render json: { message: 'Book removed from Library' }, status: :ok
  end

end

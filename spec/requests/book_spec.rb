require 'rails_helper'

RSpec.describe "Books", type: :request do
  describe "GET /index" do
    it "retornar status 200" do
      category = Category.create(name:"Infantil")
      book = Book.create(title:"Animais", author:"Antônio", category_id: category.id)

      get "/books"

      expect(response).to have_http_status(:ok)
    end
  end
  describe " Quando criar um livro" do
    it "retornar status 201" do
      category = Category.create(name:"Infantil")
      book_params = { book: {
        title: "Dinossauro",
        author: "Xavier",
        category_id: category.id
        }
      }

      post "/books", params: book_params

      expect(response).to have_http_status(:created)
    end
  end
end
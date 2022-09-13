require 'rails_helper'

RSpec.describe "Books", type: :feature do
  let(:category) { Category.create(name:"Infantil") }
  let(:admin) {User.create(name:"Teste", email:"teste@test.com", password:"1234", permission:"admin")}
  let(:user) {User.create(name:"User", email:"user@test.com", password:"1234", permission:"common")}
  before do
    category
    sign_in admin
  end

  describe "GET /index" do
    context "Quando logar com usuário comum" do
      before do
        category
        sign_in user
      
        scenario "Acessando listagem de livros" do
        
          visit '/books'

          expect(page).to have_content('Livros cadastrados')
        end
      end
    end
    
    context "Quando logar como admin" do
      scenario "Quando clicar no botão de criar livro" do

        visit '/books'

        click_link('Cadastrar livro')
        expect(page).to have_content('Cadastro de livro')
      end
    end
  end

  describe " /new" do
    scenario "Quando acessar formulário do cadastro de livro" do

      visit "/books/new"
     
      fill_in "book[title]", with: 'Dinossauro'
      fill_in "book[author]", with: 'Xavier'
      select(category.name, from: 'book[category_id]')
      click_button('Salvar')
      expect(page).to have_content('Livro cadastrado!')
    end
  end

  describe " /edit" do
    scenario "Quando editar livro " do
      book = Book.create(title: "Floresta", author: "José", category_id: category.id)
      book_params = { book: {
        title: "Férias e Diversão"
        }
      }

      visit "/books/#{book.id}/edit"

      expect(page).to have_content('Editar livro')
      click_button('Salvar')
      expect(page).to have_content('Livro atualizado!')
    end
  end

  describe " /destroy" do
    scenario "Quando for apagar livro " do
      book = Book.create(title: "Floresta", author: "José", category_id: category.id)
      
      visit "/books"

      click_link('Deletar')
      expect(page).to have_content('Livro excluído.')
      expect(Book.count).to eq(0)
    end
  end
end
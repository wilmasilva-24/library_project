require 'rails_helper'

RSpec.describe "Users", type: :feature do
  describe "GET /create" do
    scenario "Quando acessar formulário do cadastro de livro" do

      visit "/users/new"
     
      # fill_in "user[name]", with: 'Wilma'
      # fill_in "user[email]", with: 'teste@teste.com'
      # fill_in "user[permission]", with: 1
      expect(page).to have_content('Usuário cadastrado')
    
      # click_button('Salvar')
      
    end
  end
end

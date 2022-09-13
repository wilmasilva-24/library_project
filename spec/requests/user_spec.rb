require 'rails_helper'

RSpec.describe "Users", type: :feature do
  let(:user) {User.create(name:"Teste", email:"teste@test.com", password:"1234", permission:"admin")}
  before do
    sign_in user
  end
  describe " /index" do
    scenario "Acessando listagem de usuário" do
     
      visit '/users'

      expect(page).to have_content('Usuários cadastrados')
      expect(page).to have_content('Novo usuário')
    end

    scenario "Quando clicar no botão cadastrar usuário" do

      visit '/users'

      click_link('Novo usuário')
      expect(page).to have_content('Cadastro de usuário')
    end
  end
  
  describe " /new" do
    scenario "Quando for cadastrar usuário" do

      visit "/users/new"
     
      fill_in "user[email]", with: 'teste@teste.com'
      select(user.permission.humanize, from: 'user[permission]')
      click_button('Salvar')
      expect(page).to have_content('Usuário cadastrado')
   
    end
  end

  describe " /edit" do
    scenario "Quando editar usuário " do
      user = User.create(name:"Silva", email: "silva@gmail.com", password:"123", permission:"common")
      params = { user: {
        email: "wsilva@hotmail.com"
        }
      }

      visit "/users/#{user.id}/edit"

      click_button('Salvar')
      expect(page).to have_content('Usuário atualizado!')
    end
  end
end
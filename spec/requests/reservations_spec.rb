require 'rails_helper'

RSpec.describe "Reservations", type: :feature do
  let(:user) {User.create(name:"Teste", email:"teste@test.com", password:"1234", permission:"admin")}
  let(:category) { Category.create(name:"Infantil") }
  let(:book) {Book.create(title: "Era do gelo", author:"João", category: category)}
  before do
    user
    book

    sign_in user
  end
  describe "GET /index" do
    scenario "Listagem de reservas" do
     
      visit '/reservations'

      expect(page).to have_content('Lista de reservas')
      expect(page).to have_content(' Status da reserva')
    end

    scenario "Quando clicar no botão de nova reserva" do

      visit '/reservations'

      click_link('Nova reserva')
      expect(page).to have_content('Realizar reserva')
    end
  end
  describe " /new" do
    scenario "Formulário de reserva" do

      visit "/reservations/new"
    
      fill_in "reservation[created_at]", with: '2022-09-13'
     
      select(user.name, from:'reservation[user_id]')
      select(book.title, from:'reservation[book_id]')
      click_button('Salvar')
      expect(page).to have_content('Livro reservado!')
    end
  end
  describe "/edit" do
    scenario "Quando editar reserva" do
      reservation = Reservation.create(created_at:'2022-09-13', user_id: user.id, book_id: book.id)
      reservation_params = { reservation: {
        created_at: '2022-09-12'
        }
      }

      visit "/reservations/#{reservation.id}/edit"

      expect(page).to have_content('Atualizar reserva')
      fill_in "reservation[created_at]", with: '2022-09-12'
      click_button('Atualizar')
    end
  end
end

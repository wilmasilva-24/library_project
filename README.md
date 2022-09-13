# README

# Instalar dependências
bundle install

# Preparar banco de dados
Criar arquivo .env com os seguintes dados:
DATABASE_USER=postgres
DATABASE_PASSWORD=postgres

rails db:create db:migrate
rails db:seed

# Para executar aplicação
rails s

# Para executar testes unitários
rspec spec/
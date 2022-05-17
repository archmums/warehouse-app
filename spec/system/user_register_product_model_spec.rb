require 'rails_helper'

describe 'Usuário cadastra um modelo de produto' do
  it 'com sucesso' do
    #Arrange
    user = User.create!(name: 'Lucas', email: 'lucas@gmail.com', password: 'password')
    supplier = Supplier.create!(corporate_name: 'Samsung INC', brand_name: 'Samsung', registration_number: '1322195511111', 
                                full_address: 'louren Street, number ', city: 'manaus', state: 'Amazonas', email: 'keybpcasp@gmail.com')



    other_supplier = Supplier.create!(corporate_name: 'Apple INC', brand_name: 'Apple', registration_number: '5322195511111', 
                                      full_address: 'louren Street, number 20', city: 'cork', state: 'dublin', email: 'aapple.inc@gmail.com')
        
      
    #Act
    login_as(user)
    visit root_path
    within('nav') do
    click_on 'Modelos de Produto'
    end

    visit root_path
    click_on 'Modelos de Produto'
    click_on 'Cadastrar Novo'
    fill_in 'Nome', with: 'TV 40 Polegadas'
    fill_in 'Peso', with: 10000
    fill_in 'Altura', with: 60
    fill_in 'Largura', with: 90
    fill_in 'Profundidade', with: 10
    fill_in 'SKU', with: 'TV40SAMSUNGXPTOASDAF'
    select 'Samsung', from: 'Fornecedor'
    click_on 'Enviar'
      
    #Assert
    expect(page).to have_content 'Modelo de produto cadastrado com sucesso.'
    expect(page).to have_content 'TV 40 Polegadas'
    expect(page).to have_content 'Fornecedor: Samsung'
    expect(page).to have_content 'Dimensão: 60cm x 90cm x 10cm'
    expect(page).to have_content 'Peso: 10000g' 
    expect(page).to have_content 'TV40SAMSUNGXPTOASDAF'
      
      
    end
  it 'deve preencher todos campos' do
    #Arrange
    user = User.create!(name: 'Lucas', email: 'lucas@gmail.com', password: 'password')
    supplier = Supplier.create!(corporate_name: 'Samsung INC', brand_name: 'Samsung', registration_number: '1322195511111', 
                                full_address: 'louren Street, number ', city: 'manaus', state: 'Amazonas', email: 'keybpcasp@gmail.com')

      #Act
    login_as(user)
    visit root_path
    within('nav') do
    click_on 'Modelos de Produto'
    end
    visit root_path
    click_on 'Modelos de Produto'
    click_on 'Cadastrar Novo'
    fill_in 'Nome', with: ''
    fill_in 'Nome', with: ''
    click_on 'Enviar'
    #Assert
    expect(page).to have_content 'Não foi possível cadastrar o modelo do produto.'

    end

  end

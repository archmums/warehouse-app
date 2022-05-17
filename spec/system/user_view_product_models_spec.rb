require 'rails_helper'

describe 'usuário vê modelos de produtos' do
  it 'se estiver autenticado' do
    #Arrange

    #Act
    visit root_path
    within('nav') do
      click_on 'Modelos de Produto'
    end
    #Assert
    expect(current_path).to eq new_user_session_path

  end
    
  it 'a partir do menu' do
    #Arrange
    user = User.create!(name: 'Lucas', email: 'lucas@gmail.com', password: 'password')

    #Act
    login_as(user)
    visit root_path
    within('nav') do
      click_on 'Modelos de Produto'
    end

    #Assert
    expect(current_path).to eq product_models_path
    end

  it 'com sucesso' do
    #Arrange
    user = User.create!(name: 'Lucas', email: 'lucas@gmail.com', password: 'password')

    supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung Eletronic LTDA', registration_number: '1234567891234', 
                                full_address: 'Av colorado N200', email: 'Samsung@support.com')
    ProductModel.create!(name:'TV 32', weight: 8000, width: 70, height:45, depth:10, 
                        sku:'TV32SAMSU-XPT44O10s0', supplier: supplier)

    ProductModel.create!(name:'SoundBar 7.1 Sorround', weight: 3000, width: 80, height:35, depth:20, 
                        sku:'SU32-MNOATSU32dMNOAT', supplier: supplier)
    #Act
    login_as(user)
    visit root_path
    within('nav') do
      click_on 'Modelos de Produto'
    end

    #Assert
    expect(page).to have_content('TV 32')
    expect(page).to have_content('TV32SAMSU-XPT44O10s0')
    expect(page).to have_content('Samsung')
    expect(page).to have_content('SoundBar 7.1 Sorround')
    expect(page).to have_content('SU32-MNOATSU32dMNOAT')
    expect(page).to have_content('Samsung')

  end

  it 'e não existem produtos cadastros' do
    #Arrange
    user = User.create!(name: 'Lucas', email: 'lucas@gmail.com', password: 'password')
    #Act
    login_as(user)
    visit root_path
    within('nav') do
      click_on 'Modelos de Produto'
    end

    #Assert
    expect(page).to have_content 'Nenhum modelo de produto cadastro.'

  end
end
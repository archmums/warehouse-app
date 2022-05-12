require 'rails_helper'

describe 'Usuario vê fornecedores' do 
  it 'a partir do menu' do
    #Arrange

    #Act
    visit root_path
    click_on 'Fornecedores'
    #Assert
    expect(current_path).to eq suppliers_path
    
  end


  it 'e vê lista de fornecedores' do
    #Arrange
    Supplier.create!(corporate_name: 'Keyboardcaps', brand_name: 'kbcps', registration_number: '1354495511111', 
                    full_address: 'rua aparecida', city: 'manaus', state: 'Amazonas', email: 'keybpcasp@gmail.com')
    Supplier.create!(corporate_name: 'boxcebs', brand_name: 'bxcbs', registration_number: '1354325511121', 
                    full_address: 'rua alberta', city: 'Florianopolis', state: 'Santa Catarina', email: 'bcxb@gmail.com')
    #Act
    visit suppliers_path
    #Assert
    expect(page).not_to have_content('Não existe fornecedores cadastrados')
    expect(page).to have_content('kbcps')
    expect(page).to have_content('bxcbs')

  end


  it 'e não existem fornecedores cadastrados' do
    #Arrange

    #Act
    visit suppliers_path

    #Assert
    expect(page).to have_content('Não existem fornecedores cadastrados')

  end
  
end
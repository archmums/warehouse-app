require 'rails_helper'

describe 'Usuário edita um fornecedor' do
  it 'a partir da tela de detalhes' do
    #Arrange
    Supplier.create!(corporate_name: 'Apple INC', brand_name: 'Apple', registration_number: '1322195511111', 
                                full_address: 'louren Street, number ', city: 'manaus', state: 'Amazonas', email: 'keybpcasp@gmail.com')
    #Act
    visit suppliers_path
    click_on 'Apple'
    click_on 'Editar'
    #Assert
    expect(page).to have_content 'Editar fornecedor'
    expect(page).to have_field('Nome da empresa', with: 'Apple INC')
    expect(page).to have_field('Nome fantasia')
    expect(page).to have_field('CNPJ')
    expect(page).to have_field('Endereço completo')
    expect(page).to have_field('Cidade')
    expect(page).to have_field('Estado')

  end
  it 'e mantém os campos obrigatorios' do
    #Arrange
    Supplier.create!(corporate_name: 'Apple INC', brand_name: 'Apple', registration_number: '1322195511111', 
                                full_address: 'louren Street, number ', city: 'manaus', state: 'Amazonas', email: 'keybpcasp@gmail.com')
    #Act
    visit suppliers_path
    click_on 'Apple'
    click_on 'Editar'
    fill_in 'Nome da empresa', with: ''
    fill_in 'Nome fantasia', with: ''
    fill_in 'Endereço completo', with: ''
    fill_in 'Cidade', with: 'Rua alberta, N100'
    click_on 'Enviar'
  
    #Assert
    expect(page).to have_content 'Não foi possivel atualizar o cadastro do fornecedor'

  end

end
require 'rails_helper'

describe 'a partir da tela inicial' do
  it 'e clica em cadastrar galpão' do
  #Arrange

  #Act
  visit suppliers_path
  click_on 'Cadastrar fornecedor'

  #Assert
  expect(page).to have_field('Nome da empresa')
  expect(page).to have_field('Nome fantasia')
  expect(page).to have_field('CNPJ')
  expect(page).to have_field('Endereço completo')
  expect(page).to have_field('Cidade')
  expect(page).to have_field('Estado')
  expect(page).to have_field('Email')
  end

  it 'com sucesso' do 
  #Assert
    
  #Act
  visit suppliers_path
  click_on 'Cadastrar fornecedor'
  fill_in('Nome da empresa', with: 'Apple INC')
  fill_in('Nome fantasia', with: 'Apple')
  fill_in('CNPJ', with: '2345637891012')
  fill_in('Endereço completo', with: 'Avenida alberta')
  fill_in('Cidade', with: 'cork')
  fill_in('Estado', with: 'Dublin')
  fill_in('Email', with: 'Email@gmail.com')
  click_on 'Enviar'
  #Assert
  expect(current_path).to eq suppliers_path
  expect(page).to have_content 'Fornecedor cadastrado com sucesso.'
  expect(page).to have_content 'Apple'
  expect(page).to have_content 'cork'
  expect(page).to have_content 'Dublin'

  end

  it 'com dados incompletos' do
  #Arrange

  #Act
  visit suppliers_path
  click_on 'Cadastrar fornecedor'
  fill_in('Nome da empresa', with: '')
  fill_in('Nome fantasia', with: '')
  fill_in('CNPJ', with: '')
  fill_in('Endereço completo', with: '')
  fill_in('Cidade', with: '')
  fill_in('Estado', with: '')
  fill_in('Email', with: '')
  click_on 'Enviar'

  #Assert
  expect(page).to have_content('Nome da empresa não pode ficar em branco')
  expect(page).to have_content('CNPJ não pode ficar em branco')
  expect(page).to have_content('Nome fantasia não pode ficar em branco')
  expect(page).to have_content('Email não pode ficar em branco')
  expect(page).to have_content('CNPJ não possui o tamanho esperado (13 caracteres)')

  end

end
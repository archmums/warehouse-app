require 'rails_helper'

describe 'Usuário cadastra um galpão' do

  it 'a partir da tela inicial' do
    # Arrange


    # Act
    visit root_path
    click_on 'Cadastrar Galpão'

    # Assert
    expect(page).to have_field('nome')
    expect(page).to have_field('código')
    expect(page).to have_field('cidade')
    expect(page).to have_field('area')
    expect(page).to have_field('endereço')
    expect(page).to have_field('cep')
    expect(page).to have_field('descrição')

  end
  it 'com sucesso' do
  #Arrange

  #Act
  visit root_path
  click_on 'Cadastrar Galpão'
  fill_in('nome', with: 'Rio de Janeiro')
  fill_in('descrição', with: 'Galpão da zona portuária do rio')
  fill_in('código', with: 'RIO')
  fill_in('endereço', with: 'Avenida do Museu do Amanhã, 1000')
  fill_in('cidade', with: 'Rio de Janeiro')
  fill_in('cep', with: '20100-000')
  fill_in('area', with: '32000')
  click_on 'Enviar'
  #Assert
  expect(current_path).to eq root_path
  expect(page).to have_content 'Rio de Janeiro'
  expect(page).to have_content 'RIO'
  expect(page).to have_content '32000 m2'
  
  end
end
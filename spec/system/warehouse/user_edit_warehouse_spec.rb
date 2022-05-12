require 'rails_helper'

describe 'Usuário edita um galpão' do
  it 'a partir da página de detalhes'do
    #Arrange
    warehouse = Warehouse.create!(name: 'Aeroporto-SP', code: 'GRU', city: 'Guarulhos', area: 100_00,
                                 address: 'rua aparecida, 1000', cep: '15000-000', description: 'Galpão destinado para cargas internacionais')
    #Act
    visit root_path
    click_on 'Aeroporto-SP'
    click_on 'Editar'

    #Assert
    expect(page).to have_content 'Editar Galpão'
    expect(page).to have_field('Nome', with: 'Aeroporto-SP')
    expect(page).to have_field('Código')
    expect(page).to have_field('Cidade')
    expect(page).to have_field('Area')
    expect(page).to have_field('Endereço')
    expect(page).to have_field('Cep')
    expect(page).to have_field('Descrição')
  end

  it 'com sucesso' do
    #Arrange
    warehouse = Warehouse.create!(name: 'Aeroporto-SP', code: 'GRU', city: 'Guarulhos', area: 100_00,
      address: 'rua aparecida, 1000', cep: '15000-000', description: 'Galpão destinado para cargas internacionais')
    #Act
    visit root_path
    click_on 'Aeroporto-SP'
    click_on 'Editar'
    fill_in 'Nome', with: 'Galpão internacional'
    fill_in 'Area', with: '50000'
    fill_in 'Cep', with: '30500-000'
    fill_in 'Endereço', with: 'Rua alberta, N100'
    click_on 'Enviar'

    #Assert
    expect(page).to have_content 'Galpão atualizado com sucesso'
    expect(page).to have_content 'nome: Galpão internacional'
    expect(page).to have_content 'Endereço: Rua alberta, N100'
    expect(page).to have_content 'Area: 50000'
    expect(page).to have_content 'cep: 30500-000'

  end
    it 'e mantém os campos obrigatorios' do
    #Arrange
    warehouse = Warehouse.create!(name: 'Aeroporto-SP', code: 'GRU', city: 'Guarulhos', area: 100_00,
      address: 'rua aparecida, 1000', cep: '15000-000', description: 'Galpão destinado para cargas internacionais')
    #Act
    visit root_path
    click_on 'Aeroporto-SP'
    click_on 'Editar'
    fill_in 'Nome', with: ''
    fill_in 'Area', with: ''
    fill_in 'Cep', with: ''
    fill_in 'Endereço', with: 'Rua alberta, N100'
    click_on 'Enviar'

    #Assert
    expect(page).to have_content 'Não foi possivel atualizar o galpão'

  end

end
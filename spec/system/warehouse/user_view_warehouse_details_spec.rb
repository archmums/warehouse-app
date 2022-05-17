require 'rails_helper'

describe 'Usuário vê detalhes do galpão' do
  
  it 'e vê informações adicionais' do 
    # Arrange
    Warehouse.create(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100000,
                    address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                    description: 'Galpão destinado para cargas internacionais')
    # Act
    visit(root_path)
    click_on('Aeroporto SP')
    # Assert
    expect(page).to have_content('Galpão GRU')
    expect(page).to have_content('nome: Aeroporto SP')
    expect(page).to have_content('Código: GRU')
    expect(page).to have_content('Cidade: Guarulhos')
    expect(page).to have_content('Area: 100000 m2')
    expect(page).to have_content('Endereço: Avenida do Aeroporto, 1000 , cep: 15000-000')
    expect(page).to have_content('Galpão destinado para cargas internacionais')
  end

  it 'e volta para a tela inicial' do
    # Arrange
    Warehouse.create(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100000,
      address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
      description: 'Galpão destinado para cargas internacionais')
    # Act
    visit('/')
    click_on('Aeroporto SP')
    click_on('voltar')
    # Assert
    expect(current_path).to eq(root_path)
  
  end
end
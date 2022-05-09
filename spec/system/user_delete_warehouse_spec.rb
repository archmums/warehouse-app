require 'rails_helper'

describe 'usuário remove um galpão' do 
  it 'com sucesso' do
    #Arrange
    w = Warehouse.create!(name: 'Cuiaba', code: 'CRU', area: 10000, cep: '56000-000', city: 'Cuiabá',
                          description: 'Galpão bem no centro do país', address: 'Avenida Aparecida centro, n100')
    #Act
    visit root_path
    click_on 'Cuiaba'
    click_on 'Remover'

    #Assert
    expect(current_path).to eq root_path
    expect(page).to have_content 'Galpão removido com sucesso'
    expect(page).not_to have_content 'Cuiaba'
    expect(page).not_to have_content 'CRU'

  end

  it 'não apaga outros galpões' do
    #Arrange
    first_warehouse = Warehouse.create!(name: 'Cuiaba', code: 'CRU', area: 10000, cep: '56000-000', city: 'Cuiabá',
                                        description: 'Galpão bem no centro do país', address: 'Avenida Aparecida centro, n100')

    second_warehouse = Warehouse.create!(name: 'Belem', code: 'BLM', area: 40000, cep: '66000-000', city: 'Belém',
                                        description: 'Galpão bem no nrote do país', address: 'Batista campus, n100')
    #Act
    visit root_path
    click_on 'Cuiaba'
    click_on 'Remover'
    #Assert
    expect(current_path).to eq root_path
    expect(page).to have_content 'Galpão removido com sucesso'
    expect(page).to have_content 'Belem'
    expect(page).to have_content 'BLM'
  
    end

end
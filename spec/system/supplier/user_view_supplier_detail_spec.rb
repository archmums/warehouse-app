require 'rails_helper'

describe 'usuario vê detalhes de um fornecedor' do
  it 'e vê informações adicionais' do
    #Arrange
    Supplier.create!(corporate_name: 'Apple INC', brand_name: 'Apple', registration_number: '5354495511111', 
      full_address: 'Atlantic stree, n 100', city: 'Cork', state: 'Dublin', email: 'suport@apple.com')
    #Act
    visit suppliers_path
    click_on 'Apple'

    #Assert
    expect(page).to have_content('Apple INC')
    expect(page).to have_content('Apple')
    expect(page).to have_content('5354495511111')
    expect(page).to have_content('Atlantic stree, n 100')
    expect(page).to have_content('Cork')
    expect(page).to have_content('Dublin')
    expect(page).to have_content('suport@apple.com')

  end
  
  it 'e volta para tela inicial' do 
    #Arrange
    Supplier.create!(corporate_name: 'DREAM INC', brand_name: 'Dream colchões ', registration_number: '9354495511111', 
      full_address: 'Rua santos, n 250', city: 'São Paulo', state: 'São Paulo', email: 'dreaminc@support.com')
    #Act
    visit suppliers_path
    click_on 'Dream colchões'
    click_on 'Voltar'

    #Assert
    expect(current_path).to eq(suppliers_path)
  end

end
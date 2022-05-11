require 'rails_helper'

describe 'usuário vê modelos de produtos' do
  it '' do
  #Arrange


  #Act
  visit root_path
  click_on 'Modelos de Produto'

  #Assert
  expect(current_path).to eq

  end
end
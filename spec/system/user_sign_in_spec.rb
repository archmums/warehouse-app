require 'rails_helper'

describe 'Usuário se autentica' do
  it 'com sucesso' do
    #Arrange
    User.create!(email: 'lucas@gmail.com', password: 'password')
    #Act
    visit root_path
    click_on 'Entrar'
    fill_in 'E-mail', with: 'lucas@gmail.com'
    fill_in 'Senha', with: 'password'
    within('form') do
    click_on 'Entrar'
    end

    #Assert
    expect(page).not_to have_link 'Entrar'
    expect(page).to have_button 'Sair'
    expect(page).to have_content 'Login efetuado com sucesso'
    within('nav') do
      expect(page).to have_content 'lucas@gmail.com'
    end

  end

  it 'com sucesso e faz logout' do
    #Arrange
    User.create!(email: 'lucas@gmail.com', password: 'password')
    #Act
    visit root_path
    click_on 'Entrar'
    fill_in 'E-mail', with: 'lucas@gmail.com'
    fill_in 'Senha', with: 'password'
    within('form') do
      click_on 'Entrar'
    end
    click_on 'Sair'
    #Assert
    expect(page).to have_content 'Logout efetuado com sucesso.'
    expect(page).to have_link 'Entrar'
    expect(page).not_to have_link 'Sair'
    expect(page).not_to have_link 'lucas@gmail.com'


  end
end
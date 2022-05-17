require 'rails_helper'

describe 'Usuário se autentica' do
  it 'com sucesso' do
    #Arrange

    #Act
    visit root_path
    click_on 'Entrar'
    click_on 'Criar uma conta'
    fill_in 'Nome', with: 'Lucas'
    fill_in 'E-mail', with: 'pedro@gmail.com'
    fill_in 'Senha', with: 'password'
    fill_in 'Confirme sua senha', with: 'password'
    click_on 'Criar Conta'
    #Assert
    expect(page).to have_content 'Bem vindo(a)! Você realizou seu registro com sucesso.'
    expect(page).to have_content 'pedro@gmail.com'
    expect(page).to have_button 'Sair'

  end
end
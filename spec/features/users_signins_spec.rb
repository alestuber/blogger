require 'rails_helper'

RSpec.feature "UsersSignins", type: :feature do
  feature 'User signs in' do
    scenario 'with invalid credentials' do
      visit login_path
      fill_in 'Email', with: 'joe.example'
      fill_in 'Password', with: 'passw0rd'
      click_on 'Login'

      expect(page).to have_content('E-mail ou senha inválidos!')
    end
  end
end

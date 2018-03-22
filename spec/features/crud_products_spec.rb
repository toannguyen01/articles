require 'rails_helper'

describe 'User can CRUD article' do 
  it 'can create a article' do
    visit '/'
    expect(page).to have_link 'Add new Articles'
    click_on 'Add new Articles'
    expect(page).to have_content 'New Article'
    fill_in 'Title', with: 'Article created'
    click_button 'Create Article'
    expect(page).to have_content 'Article created'
  end

  context 'edit' do
    let!(:articles) {create(:article)}
    it 'edit a article' do
      visit '/'
      expect(page).to have_selector('span', text: 'Edit')
      click_on 'Edit'
      expect(page).to have_button('Update Article')
      fill_in 'Title', with: 'Article update'
      click_button 'Update Article'
      expect(page).to have_content 'Update sucessfully'  
    end  
  end
  context 'delete' do
    let!(:articles) {create(:article)}
    it 'delete a article' do
      visit '/'
      expect(page).to have_selector('span', text: 'Delete')  
      click_on 'Delete'
      expect(page).to have_content 'Update sucessfully'  
      
    end
  end

end


require 'rails_helper'

RSpec.describe PostimagesController, type: :controller do

  describe '#index' do
    let!(:postimages) { create_list(:postimage, 2) }
    it 'gets a list of postimages ' do
      get :index
      expect(assigns(:postimages)).to eq postimages
    end
  end

  describe '#new' do
    let!(:postimages) {create(:postimage)}
    it 'new postimage' do
      get :new
      expect(assigns(:postimage)).to be_a_new(Postimage)
    end
  end

  describe '#create' do
    let!(:postimage) {create(:postimage)}
    context 'success' do
      it 'create postimage' do
        post :create, params: {id: postimage.id, postimage: {headline: 'headline'}}
        expect(Postimage.count).to eq(1)
      end
    end

    context 'create fail' do
      it 'create fail postimage' do
        post :create, params: {id: postimage.id, postimage: {headline: 'headline'}}
        expect(response).to render_template :new
      end
    end
  end

  describe '#detroy' do
    let!(:postimage) {create(:postimage)}
    it 'destroy postimage' do
      delete :destroy, params: {id: postimage.id, postimage: {headline: 'headline'}}
      expect(Postimage.count).to eq(0)
    end
  end

  describe 'update postimage' do
    let!(:postimage) {create(:postimage)}
    it 'postimage updated' do
      
      put :update, params: {id: postimage.id, postimage: {headline: 'headline'} }
      response.should do  
        be_successful redirect_to assigns(:postimage) 
      end

    end
  end

end


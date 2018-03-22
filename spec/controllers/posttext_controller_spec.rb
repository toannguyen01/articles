require 'rails_helper'

RSpec.describe PosttextsController, type: :controller do

  describe '#index' do
    let!(:posttexts) { create_list(:posttext, 2) }
    it 'gets a list of posttexts ' do
      get :index
      expect(assigns(:posttexts)).to eq posttexts
    end
  end

  describe '#new' do
    let!(:posttexts) {create(:posttext)}
    it 'new posttext' do
      get :new
      expect(assigns(:posttext)).to be_a_new(Posttext)
    end
  end

  describe '#create' do
    let!(:posttext) {create(:posttext)}
    context 'success' do
      it 'create posttext' do
        post :create, params: {id: posttext.id, posttext: {headline: 'headline', content: 'content'}}
        expect(Posttext.count).to eq(1)
      end
    end

    context 'create fail' do
      it 'create fail posttext' do
        post :create, params: {id: posttext.id, posttext: {headline: 'headline', content: 'content'}}
        expect(response).to render_template :new
      end
    end
  end

  describe '#detroy' do
    let!(:posttext) {create(:posttext)}
    it 'destroy posttext' do
      delete :destroy, params: {id: posttext.id, posttext: {headline: 'headline', content: 'content'}}
      expect(Posttext.count).to eq(0)
    end
  end

  describe 'update posttext' do
    let!(:posttext) {create(:posttext)}
    it 'posttext updated' do
      
      put :update, params: {id: posttext.id, posttext: {headline: 'headline'} }
      response.should do  
        be_successful redirect_to assigns(:posttext) 
      end

    end
  end

end


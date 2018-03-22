require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe '#index' do
    let!(:articles) { create_list(:article, 2) }
    it 'gets a list of articles ' do
      get :index
      expect(assigns(:articles)).to eq articles
    end
  end

  describe '#new' do
    let!(:articles) {create(:article)}
    it 'new article' do
      get :new
      expect(assigns(:article)).to be_a_new(Article)
    end
  end

  describe '#create' do
    let!(:article) {create(:article)}
    context 'success' do
      it 'create article' do
        post :create, params: {id: article.id, article: {title: 'title'}}
        expect(response).to redirect_to articles_path
      end
    end

    context 'create fail' do
      it 'create fail article' do
        post :create, params: {id: article.id, article: {title: 'title'}}
        response.should do  
          be_successful render_template (:new)
        end        

      end
    end
  end

  describe '#detroy' do
    let!(:article) {create(:article)}
    it 'destroy article' do
      delete :destroy, params: {id: article.id, article: {title: 'title'}}
      expect(Article.count).to eq(0)
    end
  end

  describe 'update article' do
    let!(:article) {create(:article)}
    it 'article updated' do
      
      put :update, params: {id: article.id, article: {headline: 'headline'} }
      response.should do  
        be_successful redirect_to assigns(:article) 
      end

    end
  end
end
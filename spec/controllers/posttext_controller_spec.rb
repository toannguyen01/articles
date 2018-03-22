require 'rails_helper'

RSpec.describe PosttextsController, type: :controller do

  describe '#index' do
    let!(:posttexts) { create_list(:posttext, 2) }
    it 'gets a list of posttexts ' do
      get :index
      expect(assigns(:posttexts)).to eq posttexts
    end
  end




end


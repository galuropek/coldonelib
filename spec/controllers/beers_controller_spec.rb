require 'rails_helper'

RSpec.describe BeersController, type: :controller do
  describe 'GET #index' do
    let(:beers) { create_list(:beer, 3) }

    before { get :index }

    it 'populates an array of all beers' do
      expect(assigns(:beers)).to match_array(beers)
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    let(:beer) { create(:beer) }

    before { get :show, params: { id: beer } }

    it 'assigns the request question to @question' do
      expect(assigns(:beer)).to eq beer
    end

    it 'render show view' do
      expect(response).to render_template :show
    end
  end
end

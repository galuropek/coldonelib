require 'rails_helper'

RSpec.describe BeersController, type: :controller do
  UPDATE = {
    title: 'Updated Title',
    brand: 'Updated Brand'
  }.freeze

  let(:beer) { create(:beer) }

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
    before { get :show, params: { id: beer } }

    it 'assigns the requested beer to @beer' do
      expect(assigns(:beer)).to eq beer
    end

    it 'render show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'assigns a new Beer to @beer' do
      expect(assigns(:beer)).to be_a_new(Beer)
    end

    it 'render show new' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before { get :edit, params: { id: beer } }

    it 'assigns the request beer to @beer' do
      expect(assigns(:beer)).to eq beer
    end

    it 'render edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves a new beer to database' do
        expect { post :create, params: { beer: attributes_for(:beer) } }.to change(Beer, :count).by(1)
      end

      it 'redirects to index view' do
        post :create, params: { beer: attributes_for(:beer) }
        expect(response).to redirect_to beers_path
      end
    end

    context 'with invalid attributes' do
      it 'does not save beer' do
        expect { post :create, params: { beer: attributes_for(:beer, :invalid) } }.to_not change(Beer, :count)
      end

      it 're-renders new view' do
        post :create, params: { beer: attributes_for(:beer, :invalid) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      it 'assigns the requested beer to @beer' do
        patch :update, params: { id: beer, beer: attributes_for(:beer) }
        expect(assigns(:beer)).to eq beer
      end

      it 'changes beer attributes' do
        patch :update, params: { id: beer, beer: { title: UPDATE[:title], brand: UPDATE[:brand] } }
        beer.reload
        expect(beer.title).to eq  UPDATE[:title]
        expect(beer.brand).to eq UPDATE[:brand]
      end

      it 'redirects to index view' do
        patch :update, params: { id: beer, beer: attributes_for(:beer) }
        expect(response).to redirect_to beers_path
      end
    end

    context 'with invalid attributes' do
      before { patch :update, params: { id: beer, beer: attributes_for(:beer, :invalid) } }

      it 'does not change beer' do
        beer.reload
        expect(beer.title).to eq 'MyString'
        expect(beer.brand).to eq 'MyString'
      end

      it 're-renders edit view' do
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:beer) { create(:beer) }

    it 'delete the beer' do
      expect { delete :destroy, params: { id: beer } }.to change(Beer, :count).by(-1)
    end

    it 'redirects to index view' do
      delete :destroy, params: { id: beer }
      expect(response).to redirect_to beers_path
    end
  end
end

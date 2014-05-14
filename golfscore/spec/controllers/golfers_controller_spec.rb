require 'spec_helper'

describe GolfersController do
  let(:golfer) { Golfer.create!(name: 'Ted') }

  subject { response }

  describe 'GET #index' do
    it 'does not break' do
      get :index
      expect(response).to be_success
    end
  end

  describe 'GET #new' do
    before do
      get :new
    end
    it 'instantiates a new Golfer object' do
      expect(assigns(:golfer).new_record?).to be_true
      expect(assigns(:golfer).class).to eq Golfer
    end
    it { should be_success }
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'successfully creates golfer' do
        expect {
          post :create, golfer: { name: 'Sir Charles' }
        }.to change(Golfer, :count).by(1)
        expect(response).to redirect_to golfers_path
      end
    end
    context 'with INvalid attributes' do
      it 'does not create a golfer and redirects' do
        expect {
          post :create, golfer: { name: nil }
        }.to_not change(Golfer, :count)
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #edit' do
    before do
      get :edit, id: golfer
    end
    it 'assigns the golfer variable' do
      expect(assigns(:golfer)).to eq golfer
      expect(response).to be_success
    end
  end

end

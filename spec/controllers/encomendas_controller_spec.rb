require 'rails_helper'

RSpec.describe EncomendasController, type: :controller do

  let(:lote){FactoryGirl.create(:lote)}


  # This should return the minimal set of attributes required to create a valid
  # Encomenda. As you add validations to Encomenda, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {{
    responsavel: "Eduardo",
    celular: '83981081977',
    endereco: 'Aqui',
    observacao: 'Após num sei aonde'}
  }

  let(:invalid_attributes) {{
    responsavel: "",
    celular: '3981081977'
  }}

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EncomendasController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      encomenda = Encomenda.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      encomenda = Encomenda.create! valid_attributes
      get :show, params: {id: encomenda.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {:lote_id => lote.id}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      encomenda = Encomenda.create! valid_attributes
      get :edit, params: {id: encomenda.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Encomenda" do
        expect {
          post :create, params: {encomenda: valid_attributes}, session: valid_session
        }.to change(Encomenda, :count).by(1)
      end

      it "redirects to the created encomenda" do
        post :create, params: {encomenda: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Encomenda.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {encomenda: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested encomenda" do
        encomenda = Encomenda.create! valid_attributes
        put :update, params: {id: encomenda.to_param, encomenda: new_attributes}, session: valid_session
        encomenda.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the encomenda" do
        encomenda = Encomenda.create! valid_attributes
        put :update, params: {id: encomenda.to_param, encomenda: valid_attributes}, session: valid_session
        expect(response).to redirect_to(encomenda)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        encomenda = Encomenda.create! valid_attributes
        put :update, params: {id: encomenda.to_param, encomenda: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested encomenda" do
      encomenda = Encomenda.create! valid_attributes
      expect {
        delete :destroy, params: {id: encomenda.to_param}, session: valid_session
      }.to change(Encomenda, :count).by(-1)
    end

    it "redirects to the encomendas list" do
      encomenda = Encomenda.create! valid_attributes
      delete :destroy, params: {id: encomenda.to_param}, session: valid_session
      expect(response).to redirect_to(encomendas_url)
    end
  end

end

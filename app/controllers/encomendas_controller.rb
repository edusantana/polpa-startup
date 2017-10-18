class EncomendasController < ApplicationController
  before_action :set_encomenda, only: [:show, :edit, :update, :destroy, :create_pedido]

  # GET /encomendas
  # GET /encomendas.json
  def index
    @encomendas = Encomenda.all
  end

  # GET /encomendas/1
  # GET /encomendas/1.json
  def show
    set_encomenda
  end

  # GET /encomendas/new
  def new
    @encomenda = Encomenda.new
    @lote = Lote.last
  end

  # GET /encomendas/1/edit
  def edit
  end

  # POST /encomendas
  # POST /encomendas.json
  def create
    @encomenda = Encomenda.new(encomenda_params)
    @encomenda.uuid = SecureRandom.uuid

    @encomenda.frete = 5.0

    respond_to do |format|
      if @encomenda.save
        format.html { redirect_to encomenda_path(@encomenda, @encomenda.uuid), notice: 'Encomenda iniciada.' }
      else
        format.html { render :new }
      end
    end
  end

  def create_pedido
    @pedido = @encomenda.pedidos.create(nome: pedido_params['nome'], celular: pedido_params['telefone'])
    pedido_params['produto'].each do |produto_id|
      quantidade = pedido_params[:produto][produto_id]
      @pedido.pedido_produtos << @pedido.pedido_produtos.create(produto_id: produto_id, quantidade: quantidade) unless 0 == quantidade.to_i
    end
    @pedido.save
    redirect_to encomenda_path(@encomenda, @encomenda.uuid), notice: 'Pedido adicionado à encomenda.' 
  end

  def criar_encomenda
  end

  # PATCH/PUT /encomendas/1
  # PATCH/PUT /encomendas/1.json
  def update
    respond_to do |format|
      if @encomenda.update(encomenda_params)
        format.html { redirect_to @encomenda, notice: 'Encomenda was successfully updated.' }
        format.json { render :show, status: :ok, location: @encomenda }
      else
        format.html { render :edit }
        format.json { render json: @encomenda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /encomendas/1
  # DELETE /encomendas/1.json
  def destroy
    @encomenda.destroy
    respond_to do |format|
      format.html { redirect_to encomendas_url, notice: 'Encomenda was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_encomenda
      @encomenda = Encomenda.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def encomenda_params
      params.fetch(:encomenda, {})
      params.permit(:lote_id, :responsavel, :endereco, :celular, :produto)
    end
    def pedido_params
      params.fetch(:produto, {})
      params.permit(:nome, :celular, produto: {})
    end
end

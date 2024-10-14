class OrdersController < ApplicationController
  def new
    @order = Order.new
    @tables = Table.where(disponibile: true)  
    @broughts = Brought.all  
  end

  def index
    @orders = Order.includes(:table) 
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      @order.table.update(disponibile: false)

      params[:brought_ids].each do |brought_id|
        @order.order_broughts.create(brought_id: brought_id, quantita: params[:quantities][brought_id])
      end
      
      redirect_to orders_path, notice: 'Ordine creato con successo'
    else
      render :new
    end
  end

  def edit
    @order = Order.includes(order_broughts: :brought).find(params[:id])
    @tables = Table.where(disponibile: true).to_a  
    @tables << @order.table unless @tables.include?(@order.table) 
    @broughts = Brought.all 
  end

  def update
    @order = Order.includes(order_broughts: :brought).find(params[:id])
    previous_table = @order.table 
    if @order.update(order_params)
      @order.order_broughts.destroy_all
      if params[:order][:brought_ids].present?
        brought_ids = params[:order][:brought_ids].reject(&:blank?)
        brought_ids.each do |brought_id|
          quantity = params[:order][:brought_quantities][brought_id]
          if quantity.present?
            @order.order_broughts.create(brought_id: brought_id, quantita: quantity)
          end
        end
      end
      @order.table.update(disponibile: false)
      previous_table.update(disponibile: true) if previous_table.present?
      redirect_to orders_path, notice: "Ordine aggiornato con successo!"
    else
      @tables = Table.where(disponibile: true)  
      @broughts = Brought.all 
      flash.now[:alert] = "Errore nell'aggiornamento dell'ordine."
      render :edit
    end
  end
  
  def destroy
    @order = Order.includes(:order_broughts).find(params[:id])
    table = @order.table
    begin
      @order.order_broughts.destroy_all  
      @order.destroy
      table.update(disponibile: true) if table.present?
      redirect_to orders_path, notice: 'Ordine eliminato con successo e tavolo reso disponibile.'
    rescue ActiveRecord::InvalidForeignKey
      redirect_to orders_path, alert: 'Non puoi eseguire questa azione, hai elementi collegati ad esso.'
    end
  end

  private

  def order_params
    params.require(:order).permit(:table_id, order_broughts_attributes: [:id, :brought_id, :quantita, :_destroy])
  end
end

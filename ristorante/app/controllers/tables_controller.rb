class TablesController < ApplicationController
  def index
    @tables = Table.order(:numero)  
  end
  

  def new
    @table = Table.new
  end

  def create
    @table = Table.new(tavolo_params)
    if @table.save
      redirect_to tables_path, notice: 'Tavolo creato con successo.'
    else
      render :new
    end
  end

  def edit
    @table = Table.find(params[:id])
  end

  def update
    @table = Table.find(params[:id])
    if @table.update(tavolo_params)
      redirect_to tables_path, notice: 'Tavolo aggiornato con successo.'
    else
      render :edit
    end
  end

  def destroy
    @table = Table.find(params[:id])
    @table.destroy
    flash[:notice] = 'Tavolo eliminato con successo.'
    redirect_to tables_path
    rescue ActiveRecord::InvalidForeignKey
    redirect_to tables_path, alert: 'Non puoi eseguire questa azione, hai elementi collegati ad esso.'
    flash[:notice] = 'Non puoi eseguire questa azione, hai elementi collegati ad esso.'
  end

  private

  def tavolo_params
    params.require(:table).permit(:numero, :posti, :disponibile)
  end
end

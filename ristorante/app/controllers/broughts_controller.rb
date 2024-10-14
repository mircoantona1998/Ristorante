class BroughtsController < ApplicationController
  def new
    @brought = Brought.new
    @ingredients = Ingredient.all 
  end

  def index
    @broughts = Brought.all 
  end

  def create
    @brought = Brought.new(brought_params)
    
    if @brought.save
      ingredient_quantities = params[:brought][:ingredient_quantities]
      ingredient_quantities.each do |ingredient_id, quantity|
        if quantity.present?
          @brought.brought_ingredients.create(ingredient_id: ingredient_id, quantita: quantity)
        end
      end
      redirect_to broughts_path, notice: 'Portata creata con successo.'
    else
      render :new
    end
  end

  def edit
    @brought = Brought.find(params[:id])
    @ingredients = Ingredient.all 
  end

  def update
    @brought = Brought.find(params[:id])

    if @brought.update(brought_params)
      @brought.brought_ingredients.destroy_all

      if params[:brought][:ingredient_ids].present?
        ingredient_ids = params[:brought][:ingredient_ids].reject(&:blank?)
        
        ingredient_ids.each do |ingredient_id|
          quantity = params[:brought][:ingredient_quantities][ingredient_id]
          if quantity.present?
            @brought.brought_ingredients.create(ingredient_id: ingredient_id, quantita: quantity)
          end
        end
      end
      redirect_to broughts_path, notice: "Portata aggiornata con successo!"
    else
      @ingredients = Ingredient.all
      flash.now[:alert] = "Errore nell'aggiornamento della portata."
      render :edit
    end
  end

  def destroy
    @brought = Brought.find(params[:id])
    
    begin
      @brought.destroy
      redirect_to broughts_path, notice: 'Portata eliminata con successo.'
    rescue ActiveRecord::InvalidForeignKey
      redirect_to broughts_path, alert: 'Non puoi eseguire questa azione, hai elementi collegati ad esso.'
    end
  end

  private

  def brought_params
    params.require(:brought).permit(:nome, :prezzo)
  end
end

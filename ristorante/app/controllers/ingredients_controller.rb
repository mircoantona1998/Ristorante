class IngredientsController < ApplicationController
    def index
      @ingredients = Ingredient.all
    end
  
    def new
      @ingredient = Ingredient.new
    end
  
    def create
      @ingredient = Ingredient.new(ingredient_params)
      if @ingredient.save
        redirect_to ingredients_path, notice: 'Ingrediente creato con successo.'
      else
        render :new
      end
    end
    
    
    def edit
      @ingredient = Ingredient.find(params[:id]) 
    end
  
    def update
      @ingredient = Ingredient.find(params[:id])
      if @ingredient.update(ingredient_params)
        redirect_to ingredients_path, notice: 'Ingrediente aggiornato con successo.'
      else
        render :edit
      end
    end

    def destroy
      @ingredient = Ingredient.find(params[:id])
      @ingredient.destroy
      flash[:notice] = 'Ingrediente eliminato con successo.'  
      redirect_to ingredients_path  
      rescue ActiveRecord::InvalidForeignKey
      redirect_to ingredients_path, alert: 'Non puoi eseguire questa azione, hai elementi collegati ad esso.'
      flash[:notice] = 'Non puoi eseguire questa azione, hai elementi collegati ad esso.'
    end
    
    def show
      @ingredient = Ingredient.find_by(id: params[:id])
      if @ingredient.nil?
        flash[:alert] = 'Ingrediente non trovato.'
        redirect_to ingredients_path
      else
        render :show
      end
    end
    
    private
  

    def ingredient_params
      params.require(:ingredient).permit(:nome, :giacenza, :unita_di_misura)
    end
    
  end
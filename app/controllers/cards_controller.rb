class CardsController < ApplicationController
  
  def index
    @cards = Card.all
  end

  def new
  	@card = Card.new
  end

  def create
  	attributes = params[:card].permit(:original_text, :translated_text)

  	Card.create(attributes)

  	redirect_to cards_path
  end

  def edit
  	@card = Card.find(params[:id])
  end

  def update
  	@card = Card.find(params[:id])

  	attributes = params[:card].permit(:original_text, :translated_text)

  	@card.update(attributes)

  	redirect_to cards_path
  end

  def destroy
  	@card = Card.find(params[:id])

  	@card.destroy

  	redirect_to cards_path
  end

end

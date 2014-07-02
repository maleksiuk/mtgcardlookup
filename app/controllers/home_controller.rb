class HomeController < ApplicationController
  
  def index
    
    if params[:card_name]
      @card = Card.where(:name => params[:card_name]).first
    end
    
  end
  
  def search
    cards = Card.search(params[:q])    
    render json: cards.map { |card| { value: card.name } }
  end
  
end

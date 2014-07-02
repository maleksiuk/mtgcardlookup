class HomeController < ApplicationController
  
  def index    
  end
  
  def search
    cards = Card.search(params[:q])    
    render json: cards.map { |card| { value: card.name } }
  end
  
end

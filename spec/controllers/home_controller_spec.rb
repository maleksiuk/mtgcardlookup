require 'rails_helper'

RSpec.describe HomeController, :type => :controller do
  
  it "assigns @card if card_name is provided" do
    card_name = 'Akroan Crusader'
    card = Card.where(:name => card_name).first
    
    get :index, :card_name => card_name
    expect(assigns(:card)).to eq(card)
  end
  
  it "assigns @card even if card_name has wrong casing" do
    card = Card.where(:name => 'Baleful Eidolon').first
    
    get :index, :card_name => 'baleFUL eidolon'
    expect(assigns(:card)).to eq(card)
  end
end

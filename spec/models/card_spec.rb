require 'rails_helper'

RSpec.describe Card, :type => :model do
  
  it "searches based on what a card name starts with" do
    results = Card.search("Ana")
    result_names = results.map(&:name)
    
    expect(result_names).to include("Anax and Cymede")
    expect(result_names).not_to include("Baleful Eidolon")    
  end
  
  it "searches based on what a card name ends with" do
    results = Card.search("mede")
    result_names = results.map(&:name)
    
    expect(result_names).to include("Anax and Cymede")
    expect(result_names).not_to include("Baleful Eidolon")
  end
  
  it "searches based on what a card name contains" do
    results = Card.search("and Cy")
    result_names = results.map(&:name)
    
    expect(result_names).to include("Anax and Cymede")
    expect(result_names).not_to include("Baleful Eidolon")
  end
  
  it "searches without caring about casing" do
    results = Card.search("anaX")
    result_names = results.map(&:name)
    
    expect(result_names).to include("Anax and Cymede")
  end
  
  it "searches for cards other than Anax and Cymede" do
    results = Card.search("badg")
    result_names = results.map(&:name)
    
    expect(result_names).to include("Charging Badger")
  end
  
end

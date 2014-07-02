class Card < ActiveRecord::Base
  
  def self.search(query)
    Card.where("lower(name) like ?", "%#{query.downcase}%")
  end
  
end

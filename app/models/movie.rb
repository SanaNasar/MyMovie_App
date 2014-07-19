class Movie < ActiveRecord::Base
validates :title, :description, :year_released, presence: true
  validates :description, length: { minimum: 10}
  validates :year_released, numericality: { greater_than_or_equal_to: 1 }
   

  def self.search_for(query)                                                       
    where('title LIKE :query OR description LIKE :query OR year_released LIKE :query', :query => "%#{query}%") 
  end    
end

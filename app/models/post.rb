require 'byebug'
class Post < ActiveRecord::Base
  validate :sufficently_clickbaity
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }

  def sufficently_clickbaity 
    valid_titles = [/Won't Believe/,
      /Secret/, /Top /, /Guess/]
    
    if !valid_titles.any? { |s| s.match(title) }
      errors.add(:title, "not suffieciently clickbaity")
    end
  end
end

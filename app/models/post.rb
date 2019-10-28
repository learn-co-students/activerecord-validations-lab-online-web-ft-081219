class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :not_clickbait
  
  def not_clickbait
    clickbait = [/Won't Believe/, /Secret/, /Top/, /Guess/]

    if clickbait.none? {|cb| cb.match title}
      errors.add(:title, "Please use a more clickbait worthy title.")
    end
  end

end


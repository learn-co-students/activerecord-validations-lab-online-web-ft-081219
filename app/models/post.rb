class Post < ActiveRecord::Base
  
    validates :title, presence: true
    validates :content, length: {minimum: 20}
    validates :summary, length: {maximum: 50}
    validates :category, inclusion: ["Fiction", "Non_fiction"]
    include ActiveModel::Validations
    validates_with  ClickbaitValidator
end

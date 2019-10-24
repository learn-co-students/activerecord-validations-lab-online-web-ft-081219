class Post < ActiveRecord::Base
    belongs_to :author

    validates :title, presence: true, clickbait_title: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in:  %w(Fiction NonFiction),
    message: "#{:category} is not a valid type" }
end

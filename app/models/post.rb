class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 200 }
    validates :summary, length: { maximum: 200 }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
    validate :clickbait

    def clickbait
        if !title.blank? && (!title.include?("You Won't" || "Secret" || "Top" || "Guess"))
          errors.add(:clickbait, "The title is not sufficiently clickbait-y. Please try again.")
        end
      end

end

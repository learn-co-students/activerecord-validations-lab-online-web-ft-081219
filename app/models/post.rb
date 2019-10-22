class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :clickbait

    def clickbait
        clickbait_array = ["Won't Believe", "Secret", "Guess", "Top #{/\d/}"]
        if title.present? && clickbait_array.none?{|item| title.match?(item)}
            errors.add(:title, "isn't clickbait")
        end
    end
end

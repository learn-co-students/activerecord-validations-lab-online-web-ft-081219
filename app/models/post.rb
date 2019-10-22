class Post < ActiveRecord::Base
    validates :title, presence:true
    validates :content, length:{minimum:250}
    validates :summary, length:{maximum:250}
    validates :category, inclusion:{in:%w(Fiction Non-Fiction)}
    validate :must_be_clickbait

    def must_be_clickbait
        unless title.present? && title.match?(/Won't Believe|Secret|Top \d+|Guess/)
            errors.add(:title, "Must have clickbait!")
        end
    end
end

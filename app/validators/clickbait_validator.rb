class ClickbaitValidator < ActiveModel::Validator
    VALIDATION = ["Won't Believe", "Secret", "Top [number]","Guess"]
    def validate(record)
            p record.title
        if record.title
        check  =VALIDATION.any? {|term| record.title.match?(term)}
        true if check
        record.errors[:title] << "The title is not clickbait" if !check
        else
            false
        end
    end
end

# "Won't Believe", "Secret", "Top [number]", or "Guess"
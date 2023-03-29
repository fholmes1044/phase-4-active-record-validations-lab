class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion:{ in: %w(Fiction Non-Fiction)}

    validate :title_is_clickbait?

    PHRASES = [
        /Won't Believe/,
        /Secret/,
        /Top Number/,
        /Guess/
    ]

    def title_is_clickbait?
        if PHRASES.none? { |phrase| phrase.match(title) }
            errors.add(:title, "must be clickbait")
        end
    end
end

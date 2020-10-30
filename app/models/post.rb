class Post < ActiveRecord::Base
    
    validates :title, presence: true 
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-fiction)}
    validate :post_title

    CLICKBAIT_ARGS = [
        "Won't Believe",
        "Secret",
        "Top[number]",
        "Guess"
    ]

    def post_title 
        if title.present? && CLICKBAIT_ARGS.none? {|p| title.match(p)}
            errors.add(:title, "title not clickbait-y enough")
        end
    end
end

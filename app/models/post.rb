class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :must_be_clickbait

    def must_be_clickbait
        if title
            if !title.match(/Won't Believe/) && !title.match(/Secret/) && !title.match(/Top \d/) && !title.match(/Guess/)
                errors.add(:title, "title must be sufficiently clickbait-y")
            end
        end
    end
end

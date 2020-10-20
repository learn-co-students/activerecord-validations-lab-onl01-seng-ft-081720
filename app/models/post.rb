class Post < ActiveRecord::Base

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w( Fiction Non-Fiction ) } 
    validate :sufficiently_clickbaity

    def sufficiently_clickbaity
        if title
            if !title.match(/Won't Believe/) && !title.match(/Secret/) && !title.match(/Top \d/) && !title.match(/Guess/)
                errors.add(:title, "The title is not click-baity enough")
            end 
        end
    end 
end 
class Post < ActiveRecord::Base
    validates :title, presence: true 
    validates :content, :length => {:minimum => 250}
    validates :summary, :length => {:maximum => 250}
    validates :category, inclusion: {in: %w(Fiction Non_Fiction)}
    validate :not_clickbait 

    ARRAY = [/Won't Believe/, /Secret/, /Top/, /Guess/]

    def not_clickbait
        if ARRAY.none? {|p| p.match title}
            errors.add(:title, "it must be clickbait")
        end
    end
end

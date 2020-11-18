class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) } 
    # validate :clickbaitiness

    # def clickbaitiness
    #     # binding.pry
    #     self.title.include?("True Facts") || self.title.include?("Secret") || self.title.include?("Top") || self.title.include?("Guess")
    # end
end

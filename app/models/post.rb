class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    # include ActiveModel::Validations
    # validates_with TitleValidator
    validate :title_is_clickbaity

    def title_is_clickbaity
        if title.present?
            unless title.match? /Won\'t Believe|Secret|Top [1-9]|Guess/
                errors.add(:title, "is not clickbait-y enough!")
            end
        end
    end
end

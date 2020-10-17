class Post < ActiveRecord::Base
    include ActiveModel::Validations
    validates :title, presence: true, format: {with: /Won't Believe/}
    validates :content, length: {minimum: 11}
    validates :summary, length: {maximum: 299}
    validates_with CategoryValidator
    # validates_with TitleValidator


end


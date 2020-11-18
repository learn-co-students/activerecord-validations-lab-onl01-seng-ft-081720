require 'pry'

class TitleValidator < ActiveModel::Validator
    def validate(record)
        unless record.title.match? /Won\'t Believe|Secret|Top [1-9]|Guess/
            record.errors[:title] << "The title is not clickbait-y enough!"
        end
    end
end
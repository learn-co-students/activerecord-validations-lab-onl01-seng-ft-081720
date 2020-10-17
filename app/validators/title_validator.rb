class TitleValidator < ActiveModel::Validator
    def validate(record)

        unless record.category.match?("Won't Believe Secret Top Guess")
            record.errors[:email]<<"Not a valid category."
        end
    end
    


end
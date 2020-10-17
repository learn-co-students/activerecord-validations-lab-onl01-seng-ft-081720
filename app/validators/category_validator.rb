class CategoryValidator < ActiveModel::Validator
    def validate(record)
        unless record.category.match?("Fiction")
            record.errors[:email]<<"Not a valid category."
        end
    end
    


end
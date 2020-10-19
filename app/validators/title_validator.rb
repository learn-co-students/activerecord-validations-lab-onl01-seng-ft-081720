class TitleValidator < ActiveModel::Validator 
    def validate(record)
        unless record.title =~ /won't\sbelieve|secret|top\s[\d+]|guess/i
            record.errors[:title] << "Not Click Bait"
        end
    end
end
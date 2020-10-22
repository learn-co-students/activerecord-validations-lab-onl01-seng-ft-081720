class TitleValidator < ActiveModel::Validator

    def validate(record)
        if record.title
            clickbait = ["Won't Believe", "Secret", "Top[number]", "Guess"]
            if clickbait.detect {|i| record.title.include?(i)}.nil?
                record.errors[:title] << "Not enough click-bait!"
            end
        end
    end
end
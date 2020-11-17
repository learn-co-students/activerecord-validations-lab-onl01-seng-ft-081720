class TitleValidator < ActiveModel::Validator 
    def validate(record)
        if record.title
          phrases = ["Won't Believe", "Secret", "Top[number]", "Guess"]
            unless phrases.detect { |keyword| record.title.include?(keyword)}
                record.errors[:title] << "Your title is missing some key-words!"
            end
        end
    end
end
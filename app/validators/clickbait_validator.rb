class ClickbaitValidator < ActiveModel::Validator

    def validate (record)
        if !record.title.include?( "Won't Believe" || "Secret" || "Top" || "Guess" )

            record.errors [:title] << "not catchy enough" 
        end
    end
end 
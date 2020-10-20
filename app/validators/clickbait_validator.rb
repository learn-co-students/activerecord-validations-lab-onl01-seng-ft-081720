class ClickbaitValidator < ActiveModel::Validator

    def validate (record)
        if !record.includes?( "Won't Believe" || "Secret" || "Top" || "Guess" )
            
            record.errors [:title] << "not catchy enough" 
        end
    end
end
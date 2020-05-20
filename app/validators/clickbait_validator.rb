class ClickbaitValidator < ActiveModel::EachValidator
    def validate_each(link, title, words)
        unless words =~ /(Won't Believe | Secret | Top \d | Guess)/
            link.errors[title] << 'Clickbait'
        end
    end
end

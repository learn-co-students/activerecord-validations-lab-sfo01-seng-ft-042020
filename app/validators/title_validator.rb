class TitleValidator < ActiveModel::Validator

    def validate(record)
        unless record.title
            record.errors[:title] << "No title found!"
        else    unless ["Won't Believe", "Secret", "Top", "Guess"].any? {|c| record.title.include?(c)}
                    record.errors[:title] << "Your post :title is not click bait-y enough."
                end
        end
    end
end
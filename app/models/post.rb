class Post < ActiveRecord::Base
    belongs_to :author
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :clickbait_title

    def clickbait_title
        clickbaits = ["Won't Believe" || "Secret" || "Top [number]" || "Guess"]
        clickbaits.each do |c|
          if !title.nil? && !title.include?(c)
            errors.add(:title, "title should be sufficiently clickbait-y")
          end        
        end
    end

end

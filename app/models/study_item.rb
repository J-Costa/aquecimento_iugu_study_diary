class StudyItem < ApplicationRecord
    validates :title, presence: true
    def full_title
        "#{self.title} - #{self.category} "
    end
end

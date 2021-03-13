class StudyItem < ApplicationRecord
    validates :title, presence: true
    def full_title
        "#{self.title} - #{self.category} "
    end

    def done!
        update(done: true)
    end
end

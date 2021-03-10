class HomeController < ApplicationController

    def index
        
        
        @study_items = StudyItem.all
    end
end
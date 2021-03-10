class StudyItemsController < ApplicationController
    def show
        id = params[:id]
        @study_item = StudyItem.find(id)
    end

    def new
       @study_item = StudyItem.new 
    end

    def create
        @study_item = StudyItem.new 
        @study_item.title = params[:study_item][:title]
        @study_item.category = params[:study_item][:category]
        @study_item.done = params[:study_item][:done]
        @study_item.save
        redirect_to root_path
    end
    
end
class TagsController < ApplicationController
  respond_to :json

  def index
    if params[:search]
      @tags = Tag.where(['name ilike ?', params[:search] + '%']).order('name ASC')
    else
      @tags = Tag.order('name ASC').all
    end
  end
end

class TagsController < ApplicationController
  def index
    @tags = params[:search] ?
      Tag.where(['name ilike ?', params[:search] + '%']).order('name ASC') :
      Tag.order('name ASC').all
  end
end

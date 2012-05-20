class OccupationsController < ApplicationController
  def index
    @occupations = Occupation.order('name ASC').all
  end
end

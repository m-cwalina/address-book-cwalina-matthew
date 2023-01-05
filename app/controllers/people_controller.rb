class PeopleController < ApplicationController
  before_action :authorize

  def index
  end

  def edit
    @person = Person.find(params[:id])
  end

end

class Api::V1::PeopleController < ApplicationController
  before_action :set_person, only: %i[edit update destroy show]
  skip_before_action :verify_authenticity_token, only: %i[create edit update destroy]
  before_action :authorize

  # The json is rendered using index.json.jbuilder under views
  def index
    @people = Person.all
  end

  def create
    @person = Person.create!(person_params)
  end

  # The json is renedered using show.json.jbuilder under views
  def show
    @person
  end

  # Needed for the edit form
  def edit
    @person
  end

  def update
    @person.update(person_params)
  end

  def destroy
    @person.destroy
  end

  private

  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(
      :salutation, :first_name, :middle_name, :last_name, :SSN, :birth_date, :comment,
      addresses_attributes: [:id, :street, :town, :zip_code, :state, :country, :_destroy],
      emails_attributes: [:id, :email_address, :comment, :_destroy],
      phone_numbers_attributes: [:id, :phone_number, :comment, :_destroy]
    )
  end
end

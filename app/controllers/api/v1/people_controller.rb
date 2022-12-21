class Api::V1::PeopleController < ApplicationController

  def index
    @people = Person.all
    @person = Person.new
  end

  def create
    Person.create!(person_params)
  end

  private

  def person_params
    params.require(:person).permit(
      :salutation, :first_name, :middle_name, :last_name, :SSN, :birth_date, :comment,
      addresses_attributes: [:id, :street, :town, :zip_code, :state, :country, :_destroy],
      emails_attributes: [:id, :email_address, :comment, :_destroy],
      phone_numbers_attributes: [:id, :phone_number, :comment, :_destroy]
    )
  end
end

class PeopleController < ApplicationController

  def index
    @people = Person.all
    @person = Person.new
    @person.addresses.build
    @person.emails.build
    @person.phone_numbers.build
  end

  def create
    @person = Person.create!(person_params)
  end

  private

  def person_params
    params.require(:person).permit(
      :salutation,
      :first_name,
      :middle_name,
      :last_name,
      :SSN,
      :birth_date,
      :comment,
      addresses_attributes: [
        :id,
        :street,
        :town,
        :zip_code,
        :state,
        :country
      ],
      emails_attributes: [
        :id,
        :email_address,
        :comment
      ],
      phone_numbers_attributes: [
        :id,
        :phone_number,
        :comment
      ]
    )
  end
end

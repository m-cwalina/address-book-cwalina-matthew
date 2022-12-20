class PeopleController < ApplicationController
  def new
    @person = Person.new
  end

  def index
    @people = Person.all
  end

  def create
    @person = Person.new(person_params)
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
      addresses_attributes: %i[id street town zip_code state country],
      emails_attributes: %i[email_address comment],
      phone_numbers_attributes: %i[phone_number comment]
    )
  end
end

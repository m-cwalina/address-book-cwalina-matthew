
class PeopleController < ApplicationController
  before_action :authorize
  before_action :set_person, only: %i[edit update destroy]

  def index
    @people = Person.all
    @person = Person.new
    @person.addresses.build
    @person.emails.build
    @person.phone_numbers.build
  end

  def create
    @person = Person.new(person_params)
    respond_to do |format|
      if @person.save
        format.js
        format.html { redirect_to people_path, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @person
  end

  def update
    @person.update(person_params)
    redirect_to people_path
  end

  def destroy
    @person.destroy
  end

  private

  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.permit(
      :salutation, :first_name, :middle_name, :last_name, :SSN, :birth_date, :comment,
      addresses_attributes: [:id, :street, :town, :zip_code, :state, :country, :_destroy],
      emails_attributes: [:id, :email_address, :comment, :_destroy],
      phone_numbers_attributes: [:id, :phone_number, :comment, :_destroy]
    )
  end
end

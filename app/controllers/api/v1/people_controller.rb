class Api::V1::PeopleController < ApplicationController
  before_action :set_person, only: %i[edit update destroy show]
  before_action :authorize

  def index
    @people = Person.all
    @person = Person.new
  end

  # I can not find a way to use strong_params with nested_attributes
  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to people_path
    else
      render :new
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

#    @person = Person.new(
#      salutation: params[:salutation], first_name: params[:first_name], middle_name: params[:middel_name],
#      last_name: params[:last_name], SSN: params[:SSN], birth_date: params[:birth_date], comment: params[:comment],
#      addresses_attributes: [
#        id: params[:addresses][:id], street: params[:addresses][:street],
#        town: params[:addresses][:town], zip_code: params[:addresses][:zip_code],
#        state: params[:addresses][:state], country: params[:addresses][:country]
#      ],
#      emails_attributes: [
#       id: params[:emails][:id], email_address: params[:emails][:email_address],
#        comment: params[:emails][:comment]
#      ],
#      phone_numbers_attributes: [
#        id: params[:phone_numbers][:id],
#        phone_number: params[:phone_numbers][:phone_number],
#       comment: params[:phone_numbers][:comment]
#     ]
#    )

class Friend < ApplicationRecord
    #Validating the values for name, email and phone
    validates :name, presence: true, length: { minimum: 2, maximum: 25 }, format: { with: /\A[a-zA-Z\s]+\z/, message: "only allows letters and spaces" }
    validates :email, presence: true, uniqueness: true,format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :phone, presence: true, uniqueness: true, length:{minimum: 10, maximum:10}, numericality: { only_integer: true }
end
# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  birth_date :date
#  email      :string
#  first_name :string
#  gender     :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  has_one :address
   
  enum gender: {male: 'hombre', female:'mujer', other:'otro'}
  
  #TODO: mover todos los mensajes a internacionalización 
  validates_presence_of :gender, :email, :first_name, :last_name, :birth_date, :address, message: "todos los campos son reuqeridos"
  
  validates_inclusion_of :gender, in: [:male, :female, :other]
  
  validates_length_of :first_name, maximun: 30, message: "El nombre no puede tener más de 30 caracteres"
  validates_length_of :last_name, maximun: 30, message: "El apellido no puede tener más de 30 caracteres"
  validates_length_of :email, length: {minimun:3 maximun: 30}, message: "El correo debe tener entre 3 y 30 caracteres"
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: "Email invalid"}, 
      length: {minimun:3 maximun: 30}, message: "El correo debe tener entre 3 y 30 caracteres"
  
  validate :is_not_minor
  validate :only_three_users_per_city
  
  
  
  private
  
  def is_not_minor
    if birth_date < 18.years.ago
      errors.add(:birth_date, "el usuario debe ser mayor de 18 años")
      return false
    end
  end
  
  def only_three_users_per_city
    if User.count == 3
      errors.add(:base, "ya hay registrados 3 usuarios en esa ciudad, no se permiten más")
      return false
    end
  end
  
end

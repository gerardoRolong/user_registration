# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  birth_date :date             not null
#  email      :string(30)       not null
#  first_name :string(30)       not null
#  gender     :string           not null
#  last_name  :string(30)       not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
   
  enum gender: {male: 'hombre', female:'mujer', other:'otro'}
  
  #TODO: mover todos los mensajes a internacionalización 
  validates_presence_of :gender, :email, :first_name, :last_name, :birth_date, :address, message: "todos los campos son requeridos excepto descripción"
   
  validates_length_of :first_name, maximum: 30, message: "El nombre no puede tener más de 30 caracteres"
  validates_length_of :last_name, maximum: 30, message: "El apellido no puede tener más de 30 caracteres"
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: "Email inválido"}, 
      length: {minimum:3, maximum: 30, message: "El correo debe tener entre 3 y 30 caracteres"}
  validates_uniqueness_of :email, message: "el correo debe ser único" 
  validate :is_valid_gender
  validate :is_not_minor
  validate :only_three_users_per_city
  
  
  
  private
  
  def is_valid_gender
    if gender && !gender.to_sym in [:male, :female, :other]
      errors.add(:gender, "género inválido")
    end
  end
  
  def is_not_minor
    if birth_date && birth_date > 18.years.ago #nació en fecha posterior a hace 18 años
      errors.add(:birth_date, "el usuario debe ser mayor de 18 años")
      return false
    end
  end
  
  def only_three_users_per_city
    if address && User.joins(:address).where(addresses: {city_id: self.address.city_id}).count == 3
      errors.add(:base, "ya hay registrados 3 usuarios en esa ciudad, no se permiten más")
      return false
    end
  end
  
end

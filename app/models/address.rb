# == Schema Information
#
# Table name: addresses
#
#  id           :integer          not null, primary key
#  description  :string(30)       not null
#  house_number :string
#  street_info  :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  city_id      :integer          not null
#  user_id      :integer          not null
#
# Indexes
#
#  index_addresses_on_city_id  (city_id)
#  index_addresses_on_user_id  (user_id)
#
# Foreign Keys
#
#  city_id  (city_id => cities.id)
#  user_id  (user_id => users.id)
#
class Address < ApplicationRecord
  belongs_to :city
  belongs_to :user
  
  validates_presence_of :street_info, :city, :user, :description, message: "todos los campos de la dirección son requeridos"
  validates_length_of :description, maximum: 30, message: "La descipción no puede tener más de 30 caracteres"  
  validates_length_of :street_info, maximum: 30, message: "La dirección no puede tener más de 30 caracteres"
  
end

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
  
  validates_inclusion_of :gender, in [:male, :female, :other]
end

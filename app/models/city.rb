# == Schema Information
#
# Table name: cities
#
#  id            :integer          not null, primary key
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  department_id :integer          not null
#
# Indexes
#
#  index_cities_on_department_id  (department_id)
#
# Foreign Keys
#
#  department_id  (department_id => departments.id)
#
class City < ApplicationRecord
  belongs_to :department
  has_many :address
end

# == Schema Information
#
# Table name: departments
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  country_id :integer          not null
#
# Indexes
#
#  index_departments_on_country_id  (country_id)
#
# Foreign Keys
#
#  country_id  (country_id => countries.id)
#
class Department < ApplicationRecord
  belongs_to :country
  has_many :cities
end

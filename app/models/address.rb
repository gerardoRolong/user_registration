# == Schema Information
#
# Table name: addresses
#
#  id           :integer          not null, primary key
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
end

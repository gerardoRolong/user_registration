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
require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

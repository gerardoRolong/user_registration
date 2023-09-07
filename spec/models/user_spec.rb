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
require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

class Market < ApplicationRecord
  has_many :balances
end

# == Schema Information
#
# Table name: markets
#
#  id         :bigint(8)        not null, primary key
#  clp        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  btf        :float
#  bth        :float
#

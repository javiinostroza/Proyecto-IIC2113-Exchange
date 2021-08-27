# == Schema Information
#
# Table name: wallets
#
#  id         :bigint(8)        not null, primary key
#  clp        :integer
#  user_id    :bigint(8)        not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_wallets_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
module WalletsHelper
end

# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  city       :string
#  street     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  contact_id :integer
#
# Indexes
#
#  index_addresses_on_contact_id  (contact_id)
#
# Foreign Keys
#
#  fk_rails_...  (contact_id => contacts.id)
#
class Address < ApplicationRecord
  belongs_to :contact, optional: true
end

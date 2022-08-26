# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  birthdate  :date
#  email      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  kind_id    :integer
#
# Indexes
#
#  index_contacts_on_kind_id  (kind_id)
#
# Foreign Keys
#
#  fk_rails_...  (kind_id => kinds.id)
#
require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

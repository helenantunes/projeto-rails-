# == Schema Information
#
# Table name: phones
#
#  id         :integer          not null, primary key
#  number     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  contact_id :integer
#
# Indexes
#
#  index_phones_on_contact_id  (contact_id)
#
# Foreign Keys
#
#  fk_rails_...  (contact_id => contacts.id)
#
class PhoneSerializer < ActiveModel::Serializer
    attributes :id, :number

    belongs_to :contact do
        link(:related) {contact_phones_url(object.contact.id)}
    end
end

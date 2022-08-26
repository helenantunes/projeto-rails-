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
class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate #, :author

  belongs_to :kind, optional: true
  has_many :phones
  has_one :address

  link(:self) {contact_path(object.id)}  
  #self se refere ao proprio recurso no aso Contacts

  # def author
  #   "Helena Antunes"
  # end

  meta do 
    {author: "Helena Antunes"} #vai adicionar essa infpormação para todas as chamadas
  end 

 def attributes(*args)
      hash = super(*args)
       # pt br -->h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
       hash[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
       #hash[:h12] = object.name.upcase
       hash
  end
end

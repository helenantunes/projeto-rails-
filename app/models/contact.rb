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
class Contact < ApplicationRecord

  #Associações
  belongs_to :kind, optional: true
  has_many :phones
  has_one :address

  accepts_nested_attributes_for :phones, allow_destroy: true #permite cadastrar com phones ou não/ permite atravez de um contato apagar um telefone
  accepts_nested_attributes_for :address, update_only: true #para atualizar o contato e não criar outro 

  # def as_json(options={})
  #     h = super(options)
  #     h[:birthdate] = (I18N.l(self.birthdate) unless self.birthdate.blank?)
  #     h
  # end

  # def to_br
  #   {
  #     name: self.name,
  #     email: self.email,
  #     birtdate: (I18N.l(self.birthdate) unless self.birthdate.blank?)
  #   }
  #end

    # def author
    #  "Helena Antunes"
    # end

    # def kind_description
    #   self.kind.description
    # end

    # def as_json(options={})
    #   super(
    #     root: true,
    #     methods: [:kind_description, :author],
    #     include: {kind: {only: :description}} #>> para mostrar apenas descrição (exemplo)
    #     )
    # end
end

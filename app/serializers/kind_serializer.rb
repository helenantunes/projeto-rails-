# == Schema Information
#
# Table name: kinds
#
#  id          :integer          not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class KindSerializer < ActiveModel::Serializer
  attributes :id, :description
end

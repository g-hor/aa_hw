# == Schema Information
#
# Table name: bands
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Band < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  # has_many :members,
  #   primary_key: :id,
  #   foreign_key: :band_id,
  #   class_name: :User,
  #   inverse_of: band


end

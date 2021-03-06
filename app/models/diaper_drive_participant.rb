# == Schema Information
#
# Table name: diaper_drive_participants
#
#  id              :integer          not null, primary key
#  name            :string
#  contact_name    :string
#  email           :string
#  phone           :string
#  comment         :string
#  organization_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class DiaperDriveParticipant < ApplicationRecord
  belongs_to :organization  # Automatically validates presence as of Rails 5
  has_many :donations, inverse_of: :diaper_drive_participant

  validates :name, presence: true
  validates :phone, presence: { message: "Must provide a phone or an e-mail" }, if: Proc.new { |ddp| ddp.email.blank? }
  validates :email, presence: { message: "Must provide a phone or an e-mail" }, if: Proc.new { |ddp| ddp.phone.blank? }
end

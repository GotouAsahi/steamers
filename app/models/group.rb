class Group < ApplicationRecord

  has_one_attached :image

  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users, source: :user

  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'

  has_many :group_mails, dependent: :destroy
  validates :name, presence: true
  validates :introduction, presence: true
end

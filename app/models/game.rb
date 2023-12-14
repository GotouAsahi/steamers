class Game < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :game_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :view_counts, dependent: :destroy

  validates :game_name, presence: true
  validates :caption, presence: true, length: { maximum: 300 }
  validates :star, presence: true
  validates :tag, presence: true

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.png')
      image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  scope :created_today, -> { where(created_at: Time.zone.now.all_day) }
  scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) }
  scope :created_this_week, -> { where(created_at: 6.day.ago.beginning_of_day..Time.zone.now.end_of_day) }
  scope :created_last_week, -> { where(created_at: 2.week.ago.beginning_of_day..1.week.ago.end_of_day) }
  scope :created_day_before, ->(d) { where(created_at: d.day.ago.all_day) }
end

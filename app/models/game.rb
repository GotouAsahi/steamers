class Game < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :game_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :view_counts, dependent: :destroy

  validates :game_name, presence: true
  validates :caption, presence: true, length: { maximum: 300 }

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
end

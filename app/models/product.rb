class Product < ApplicationRecord
  # acts_as_paranoid
  acts_as_list scope: :user

  has_one_attached :cover do |attachable|
    attachable.variant :thumb, resize_to_limit: [300, 300]
  end

  belongs_to :user
  has_many :comments, ->{ order(id: :desc) }

  has_many :like_products
  has_many :liked_users, through: :like_products, source: :user

  validates :title, presence: true
  validates :price, numericality: { greater_than: 0 }

  #scope
  # scope :ok, -> { where(deleted_at: nil) }
  # scope :cheap, -> { where("price <=30") }
  default_scope { where(deleted_at: nil) }

  #軟刪除(加上時間戳記)
  def destroy
    update(deleted_at: Time.current)
  end
end

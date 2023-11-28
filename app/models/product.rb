class Product < ApplicationRecord
  # acts_as_paranoid

  belongs_to :user
  has_many :comments, ->{ order(id: :desc) }

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

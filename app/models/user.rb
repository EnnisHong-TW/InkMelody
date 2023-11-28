class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true

  # 儲存前將密碼進行加密
  # before_save 在Create及Update時都會觸發，所以將密碼加密寫入應該使用before_create
  # before_save :encrypt_password
  before_create :encrypt_password

  #{email: '..', password: '...'}
  def self.login(data)
    email = data[:email]
    password = Digest::SHA256.hexdigest("*xx#{data[:password]}yy-")
    # find_by(email: email, password: password)
    find_by(email: , password: )
  end

  private

  def encrypt_password
    # salting 撒鹽
    salted_password = "*xx#{self.password}yy-"
    self.password = Digest::SHA256.hexdigest(salted_password)
  end
end
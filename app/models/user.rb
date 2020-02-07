class User < ApplicationRecord
  has_many :microposts, dependent: :destroy

  attr_accessor :remember_token, :activation_token
  self.per_page = 20

  before_save { self.email = email.downcase }
  before_create :create_activation_digest

  validates :name, presence: true,
                   length: { maximum: 51, minimum: 5 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 200 },
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { maximum: 20, minimum: 6 }, allow_nil: true
  has_secure_password
  #digest a token
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  #remember the user
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(self.remember_token))
  end

  #check if the remember_token match the remember_digest
  def authenticate?(attribute, token)
    digest = self.send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def activate
    if (!activated)
      self.update_attribute(:activated, true)
      self.update_attribute(:activated_at, Time.zone.now)
    end
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  private

  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end
end

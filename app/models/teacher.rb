# == Schema Information
#
# Table name: teachers
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  surname         :string(255)
#  patronymic      :string(255)
#  email           :string(255)
#  birthdate       :date
#  degree          :integer
#  position        :integer
#  status          :integer
#  seniority       :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

class Teacher < ActiveRecord::Base
  
  NAME_MAXIMUM_LENGTH = 50
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  attr_accessible :birthdate, :degree, :email, :name, :patronymic, :position, :seniority, :status, :surname, :password, :password_confirmation
  has_secure_password

  validates :name, presence: true, length: { maximum: NAME_MAXIMUM_LENGTH }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
  before_save { |teacher| teacher.email = email.downcase }
  before_save :create_remember_token

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end

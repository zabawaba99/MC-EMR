
  # Copyright ©  Mobile Clinic-Electronic Medical Records.
  #   Permission is granted to copy, distribute and/or modify this document
  #   under the terms of the GNU Free Documentation License, Version 1.3
  #   or any later version published by the Free Software Foundation;
  #   with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.
  #   A copy of the license is included in the section entitled "GNU
  #   Free Documentation License".
class Appuser < ActiveRecord::Base
  attr_accessible :status, :userType, :email, :lastName, :firstName, :password, :userName, :secondaryTypes, :avatar, :delete_avatar

  # before saving to the DB it will make userName and email to all lowercase Ensuring email uniquenesss
  before_save { |appuser| appuser.userName = userName.downcase}
  before_save { |appuser| appuser.email = email.downcase}
  before_validation :clear_photo
  attr_accessible :email, :firstName, :lastName, :password, :password_confirmation, :status, :userType, :userName

  validates :password, length:  { minimum: 6 }, :on => :create

  validates :userName, presence: true , length: {maximum: 50 , minimum: 5} , uniqueness: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true , format: { with: VALID_EMAIL_REGEX } , uniqueness: true 
  validates :lastName, presence: true    
  validates :firstName, presence: true
  validates :status, presence: true
  validates :userType, presence: true
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment :avatar,
  :content_type => { :content_type => [/^image\/(?:jpeg|gif|png)$/, nil] },
  :size => { :in => 0..2000.kilobytes }

  set_primary_key :userName
  has_many :visits, :foreign_key => 'doctorId'

 def delete_avatar=(value)
    @delete_avatar = !value.to_i.zero?
  end
  
  def delete_avatar
    !!@delete_avatar
  end
  alias_method :delete_avatar?, :delete_avatar

  # Later in the model
def clear_photo
  self.avatar = nil if delete_avatar? && !avatar.dirty?
end

end
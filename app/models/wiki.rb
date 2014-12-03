class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators, dependent: :destroy
  has_many :users, through: :collaborators

  scope :visible_to, -> (user) { user ? all : where(private: false) }
  accepts_nested_attributes_for :collaborators

  def public?
    !self.private
  end

  attr_accessor :is_collaborator
  def is_a_collaborator
    self.users.include?(user)

  end

  def is_a_collaborator=(true_or_false)
    self.collaborators.where(user: @user).any? ? 'true' : 'false'
  end

end

class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators, dependent: :destroy
  has_many :users, through: :collaborators

  scope :visible_to, -> (user) { user ? all : where(private: false) }
  accepts_nested_attributes_for :collaborators

  def public?
    !self.private
  end


end

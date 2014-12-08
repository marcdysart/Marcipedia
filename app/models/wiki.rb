class Wiki < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
  belongs_to :user
  has_many :collaborators, dependent: :destroy
  has_many :users, through: :collaborators

  scope :visible_to, -> (user) { user ? all : where(private: false) }
  accepts_nested_attributes_for :collaborators

  def public?
    !self.private
  end



  # def should_generate_new_friendly_id?
  #   new_record?
  # end

end

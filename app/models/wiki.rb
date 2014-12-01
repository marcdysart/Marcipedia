class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators, dependent: :destroy
  has_many :users, through: :collaborators

  scope :visible_to, -> (user) { user ? all : where(private: false) }

  # after_initialize :wiki_init
  # def wiki_init
  #   self.private ||= 'false'
  # end

  def public?
    !self.private
  end
end

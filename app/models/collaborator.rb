class Collaborator < ActiveRecord::Base
  belongs_to :user
  belongs_to :wiki


  # def include?(user)
  #    self.collaborator << user
  # end

end

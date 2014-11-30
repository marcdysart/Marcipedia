class Collaborator < ActiveRecord::Base
  delegate :user, :wiki, to: :collaborator
end

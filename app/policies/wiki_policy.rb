 class WikiPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    user.present? || !record.private
  end

  def update?
    user.present? && (user == record.user || !record.private)
  end

  def destroy?
    user.present? && (user == record.user)
  end
 end

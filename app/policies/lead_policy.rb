class LeadPolicy < ApplicationPolicy
  attr_reader :user, :lead
  class Scope < Scope
    def resolve
      if user.agent?
        scope.where(user_id: @user.try(:id)).order(created_at: :desc)
      elsif user.biller?
        scope.where(status: 'charged').order(created_at: :desc)
      else
        scope.order(created_at: :desc)
      end
    end
  end

  def index?
    true
  end

  def edit?
    true
  end

  def new?
    !user.authorization && !user.biller
  end

  def create?
    user.agent || user.admin
  end

  def update?
    true
  end 


end

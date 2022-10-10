class LeadPolicy < ApplicationPolicy
  attr_reader :user, :lead
  class Scope < Scope
    def resolve
      if user.agent?
        scope.where(user_id: @user.try(:id))
      else
        scope.all
      end
    end
  end

  def index?
    true
  end

  def edit?
    !user.biller
  end

  def new?
    !user.authorization
  end

  def permitted_attributes_for_edit
    if user.admin?
      [:status]
    end
  end



  

end
class TaxHistoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  
  def index?
    return true
  end

  def create?
    record.property.user == user
  end


end

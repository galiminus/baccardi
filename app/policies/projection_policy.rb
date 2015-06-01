class ProjectionPolicy < Struct.new(:user, :resource)
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope.where(user: user)
    end
  end

  def index?
    user
  end

  def show?
    resource.user_id == user.id
  end

  def create?
    true
  end

  def update?
    resource.user_id == user.id
  end

  def destroy?
    resource.user_id == user.id
  end
end

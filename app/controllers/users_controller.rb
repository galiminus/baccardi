class UsersController < InheritedResources::Base
  respond_to :json

  def google
    @oauth = OAuth.const_get(action_name.capitalize).new params
    @user = User.for_oauth @oauth

    render json: { id: @user.id, token: Token.encode(@user.id) }
  end

  has_many :projections
end

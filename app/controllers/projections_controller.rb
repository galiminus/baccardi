class ProjectionsController < ApplicationController
  before_filter :set_current_user, :authenticate_user!

  after_action :verify_authorized

  extend Zobi
  behaviors :inherited, :included, :paginated, :controlled_access

  def permitted_params
    params.permit(projection: [ :id, :variation, :label, :recurring ])
  end

  belongs_to :user
end


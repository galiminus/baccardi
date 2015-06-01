class ProjectionsController < ApplicationController
  before_filter :set_current_user, :authenticate_user!

  after_action :verify_authorized

  extend Zobi
  behaviors :inherited, :included, :paginated, :controlled_access

  belongs_to :user
end


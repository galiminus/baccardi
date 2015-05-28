class ProjectionsController < InheritedResources::Base
  respond_to :json

  def permitted_params
    params.permit(projection: [ :id, :variation, :label, :reccuring ])
  end

  belongs_to :user
end


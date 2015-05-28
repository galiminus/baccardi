class ProjectionSerializer < ActiveModel::Serializer
  attributes :id, :variation, :label, :recurring
end

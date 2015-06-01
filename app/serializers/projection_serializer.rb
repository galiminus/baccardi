class ProjectionSerializer < ActiveModel::Serializer
  attributes :id, :variation, :label, :recurring, :created_at
end

class ProjectionParameters < Zobi::ParametersSanitizer
  def fields
    [ :id, :variation, :label, :recurring ]
  end
end

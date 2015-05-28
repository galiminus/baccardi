Fabricator(:projection) do
  variation { rand(2000) - 1000         }
  recurring { FFaker::Boolean.random    }
  user      { User.first                }
  tag       { Tag.all.sample            }
end

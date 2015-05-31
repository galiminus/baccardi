Fabricator(:projection) do
  variation { rand(2000) - 1000              }
  recurring { FFaker::Boolean.random         }
  label     { FFaker::Lorem.words.join(" ")  }
end

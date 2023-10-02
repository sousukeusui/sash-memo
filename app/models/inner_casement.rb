class InnerCasement < ApplicationRecord
  belongs_to :inner_sash

  enum hanging_origin: {right: 0, left: 1}
end

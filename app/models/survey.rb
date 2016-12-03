class Survey < ApplicationRecord
  has_many :questions, :dependent => :destroy, inverse_of: :survey

  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: :true
end

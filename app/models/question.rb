class Question < ApplicationRecord
  belongs_to :survey, inverse_of: :questions
  has_many :options, :dependent => :destroy, inverse_of: :question

  accepts_nested_attributes_for :options, reject_if: :all_blank, allow_destroy: :true


end

class Question < ApplicationRecord
  # Declare so they can be passed in form_for parameters.
  # NOT included in database
  attr_accessor :option_num

  belongs_to :survey, inverse_of: :questions
  belongs_to :question_type

  has_many :options,   dependent: :destroy,
                       inverse_of: :question
  has_many :responses, dependent: :destroy

  accepts_nested_attributes_for :options,
                                reject_if: :all_blank,
                                allow_destroy: :true
end

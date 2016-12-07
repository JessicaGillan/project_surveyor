module QuestionsHelper

  def q_type_id_for(name)
    if qt = QuestionType.find_by(name: name)
      qt.id
    end
  end

  def question_type_options
    q_types ||= QuestionType.all.map{|t| [ t.name, t.id ] }
  end

  def select_type_text(question)
    case question.question_type.name
    when "Multiple Choice" then "Select one."
    when "Multiple Select" then "Select many."
    else ""
    end
  end
end

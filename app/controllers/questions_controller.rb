class QuestionsController < ApplicationController
  def new
    @survey = Survey.find_by_id( params[:survey_id] )
    @question = @survey.questions.build

    @question_types = QuestionType.all.map{|t| [ t.name, t.id ] }
  end

  def create
    @survey = Survey.find_by_id( params[:survey_id] )
    @question = @survey.questions.build( question_params )

    if @question.save
      flash[:success] = "Question Added!"
      redirect_to edit_survey_question_path(@survey, @question)
    else
      flash.now[:error] = "Sorry, we couldn't add that question due to errors."
      render :new
    end
  end

  def edit
    @survey = Survey.find_by_id( params[:survey_id] )
    @question = @survey.questions.find_by_id( params[:id] )
    @q_type = @question.question_type.name
  end

  private

    def question_params
      params.require(:question)
            .permit(:question_type_id,
                    :body,
                    :required)
    end
end

class QuestionsController < ApplicationController
  def new
    @survey = Survey.find_by_id( params[:survey_id] )
    @question = @survey.questions.build
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

  # TODO: Handle "back to prev step" link
  def update
    @survey = Survey.find_by_id( params[:survey_id] )
    @question = Question.find_by_id( params[:id] )

    if @question.update( question_params )
      if params[:commit] == "Continue to the Next Step"
        params[:option_num].to_i.times do
          @question.options.create # TODO: cleanup, could create empty options in db
        end

        redirect_to edit_survey_question_path(@survey, @question)
      else
        flash.now[:success] = "Question Added!"

        # Create new empty question for render
        @question = @survey.questions.build

        render :new
      end
    else
      flash.now[:error] = "Sorry, we couldn't add that question due to errors."
      render :new
    end
  end

  def destroy
    @survey = Survey.find_by_id( params[:survey_id] )
    @question = Question.find_by_id( params[:id] )

    if @question.destroy
      flash[:success] = "Question deleted."
      redirect_to new_survey_question_path @survey
    else
      flash[:error] = "Oops. We messed. Couldn't delete the question."
      redirect_to new_survey_question_path @survey
    end
  end

  private

    def question_params
      params.require(:question)
            .permit(:question_type_id,
                    :body,
                    :required,
                    { options_attributes: [ :id, :body,
                                            :question_id ] } )
    end
end

# Parameters: {"utf8"=>"✓", "authenticity_token"=>"xzGs+A8+JA5bsbsGGROZLUcpu6au0m8Pq3EXQnjQP1SE3LiibCXxbyWc2KGA4ug6uIP1apUHhwrMcuDbtCpYcg==", "option_num"=>"4", "question_type"=>"Multiple Choice", "question"=>{"required"=>"yes"}, "commit"=>"Continue to the Next Step", "survey_id"=>"8", "id"=>"5"}

# Parameters: {"utf8"=>"✓", "authenticity_token"=>"hkIL9fxiYfMS2svhLJ7f1iw5zpObS60/TxmPXoE0ba/Frx+vn3m0kmz3qEa1b67B05OAX6CeRTooGnjHTc4KiQ==", "question"=>{"body"=>"asdfsadf question", "options_attributes"=>{"0"=>{"body"=>"asdfsadf option", "id"=>"6"}}}, "commit"=>"Add Question", "survey_id"=>"19", "id"=>"15"}

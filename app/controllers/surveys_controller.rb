class SurveysController < ApplicationController

#show edit new index
  def index
    @surveys = Survey.all
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      flash[:success] = "Survey Created!"
      redirect_to @survey
    else
      flash.now[:error] = "Try again!"
      render :new
    end
  end

  def new
    @survey = Survey.new
    @survey.questions.build
  end

  def show
    @survey = Survey.find_by_id( params[:id] )
  end

  def update
    #
  end

  def update
    #
  end

  def destroy
    #
  end

  private
    def survey_params
      params.require(:survey)
            .permit( :title,
                     { questions_attributes: [ :question,
                                              :survey_id, :id,
                                              :_destroy ] } )
    end
end

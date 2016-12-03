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
    #
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
      #
    end
end

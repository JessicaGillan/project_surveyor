class SurveysController < ApplicationController

  def index
    @surveys = Survey.all
  end

  def create
    @survey = Survey.new( survey_params )
    if @survey.save
      flash[:success] = "Survey Created!"
      redirect_to new_survey_question_path @survey
    else
      flash.now[:error] = "Sorry, we couldn't save your survey due to errors."
      render :new
    end
  end

  def new
    @survey = Survey.new
  end

  def show
    @survey = Survey.find_by_id( params[:id] )
  end

  def update
    @survey = Survey.find_by_id( params[:id] )
    if @survey.update( survey_params )
      flash[:success] = "Survey Updated!"
      redirect_to @survey
    else
      flash.now[:error] = "We couldn't update your survey."
      render :new
    end
  end

  def edit
    @survey = Survey.find_by_id( params[:id] )
  end

  def destroy
    #
  end

  private
    def survey_params
      params.require(:survey)
            .permit( :title,
                     :description,
                     { question: [ :id, :body,
                                   :survey_id,
                                   :required,
                                   :_destroy ] } )
    end
end

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
    4.times do
      a = @survey.questions.build
      4.times { a.options.build }
    end
  end

  def show
    @survey = Survey.find_by_id( params[:id] )
  end

  def update
    @survey = Survey.find_by_id( params[:id] )
    if @survey.update( survey_params )
      flash[:success] = "Survey Created!"
      redirect_to @survey
    else
      flash.now[:error] = "Try again!"
      render :new
    end
  end

  def edit
    @survey = Survey.find_by_id( params[:id] )
    4.times do
      a = @survey.questions.build
      4.times { a.options.build }
    end
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

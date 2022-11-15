class ResponsesController < ApplicationController
  before_action :set_questionnaire, except: :show
  before_action :set_response, only: %i[ edit update destroy ]

  def show
    @questionnaire = Questionnaire.includes(questions: :answers).find(params[:questionnaire_id])
    @response = @questionnaire.responses.find(params[:id])
  end

  def new
    @response = @questionnaire.responses.new
  end

  def create
    @response = @questionnaire.responses.new(response_params)

    if @response.save
      redirect_to [@questionnaire, @response], notice: "Response was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_questionnaire
    @questionnaire = Questionnaire.find(params[:questionnaire_id])
  end

  def set_response
    @response = @questionnaire.responses.find(params[:id])
  end

  def response_params
    params.require(:response).permit(:questionnaire_id, answers: {})
  end
end

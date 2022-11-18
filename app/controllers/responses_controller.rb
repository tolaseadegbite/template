class ResponsesController < ApplicationController
  before_action :set_questionnaire
  before_action :set_response, only: %i[ edit update destroy ]

  def index
    @responses = @questionnaire.responses
  end

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
    @response = Response.find(params[:id])
  end

  def response_params
    params.require(:response).permit(:questionnaire_id, answers: {}).merge(user: current_user)
    # .merge(questionnaire_id: params[:questionnaire_id])
  end
end

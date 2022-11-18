class QuestionnairesController < ApplicationController
  before_action :set_questionnaire, only: %i[ show edit update destroy ]

  def index
    if current_user.admin?
      # if params.has_key?(:level)
      #   @level = Questionnaire.levels[params[:level]]
      #   @level_questionnaires = Questionnaire.where(level: level)
      # end
      @questionnaires = Questionnaire.all.order(created_at: :desc)
    else
      @questionnaires = Questionnaire.all.order(created_at: :desc)
    end
  end

  def show
  end

  def new
    @questionnaire = Questionnaire.new
  end

  def edit
  end

  def create
    # current_user.admin?
    @questionnaire = current_user.questionnaires.new(questionnaire_params)

    if @questionnaire.save
      redirect_to @questionnaire, notice: 'Evaluation was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @questionnaire.user == current_user
      if @questionnaire.update(questionnaire_params)
        redirect_to @questionnaire, notice: 'Questionnaire was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    if @questionnaire.user == current_user
        @questionnaire.destroy
        redirect_to questionnaires_url, notice: "Questionnaire record successfully deleted"
    else
        redirect_to questionnaires_path, alert: "You are not authorized"
    end
  end

  def ND_I
    @questionnaires = Questionnaire.ND_I
    render :index
  end
  
  def ND_II
    @questionnaires = Questionnaire.ND_II
    render :index
  end

  def HND_I
    @questionnaires = Questionnaire.HND_I
    render :index
  end

  def HND_II
    @questionnaires = Questionnaire.HND_II
    render :index
  end

  private

  def set_questionnaire
    @questionnaire = Questionnaire.find(params[:id])
  end

  def questionnaire_params
    params.require(:questionnaire).permit(
      :name,
      :level,
      :semester,
      :description,
      questions_attributes: [
        :_destroy,
        :id,
        :question_type,
        :name,
        :required,
        answers_attributes: [:_destroy, :id, :name]
      ]
    )
  end
end

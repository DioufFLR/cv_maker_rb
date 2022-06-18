class CompetenceController < ApplicationController
  before_action :authorize_request

  # GET /competence
  def index
    @competences = Competence.all
    render json: @competences, status: :ok
  end

  # GET /competence/{code}
  def show
    render json: @competence, status: :ok
  end

  # POST /competence
  def create
    @competence = Competence.new(competence_params)
    if @competence.save
      render json: @competence, status: :created
    else
      render json: { errors: @competence.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PUT /competence/{code}
  def update
    unless @competence.update(competence_params)
      render json: { errors: @competence.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /competence/{code}
  def destroy
    @competence.destroy
  end

  private

  def competence_params
    params.permit(
          :code, :title, :description, :image
    )
  end
end

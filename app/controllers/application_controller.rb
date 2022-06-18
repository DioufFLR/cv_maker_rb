class ApplicationController < ActionController::API
  def info
    render json: ApiInfo.new('CVM_RG', '0.1')
  end

  # Url inconnu
  def not_found
    render json: { error: 'not_found' }
  end

  # Les requetes doivent etre pour des utilisateurs connectés
  # Utilisation de JWT
  def authorize_request
    # Recupération du token
    header = request.headers['Authorization']
    header = header.split(' ').last if header

    # Recuperation de l'utilisateur dans le token et vérification de son existance
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end

##
# API INFOS
class ApiInfo
  def initialize(api_name, api_version)
    @api_name = api_name
    @api_version = api_version
  end
end

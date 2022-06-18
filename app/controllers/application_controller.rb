class ApplicationController < ActionController::API
  def info
    render json: ApiInfo.new('CAPTIVE_NG', '0.1')
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

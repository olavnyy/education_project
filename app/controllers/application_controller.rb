class ApplicationController < ActionController::API
  include ActionController::RequestForgeryProtection
  include CanCan::ControllerAdditions

  attr_reader :current_user

  before_action :authenticate_request!, except: [:authenticate_user]

  private

  def render_content(item)
    render json: item
  end

  def decode_base64_image(image)
    if image[:base64] && image[:filetype] && image[:filename]
      decoded_data = Base64.decode64(image[:base64])

      data = StringIO.new(decoded_data)
      data.class_eval do
        attr_accessor :content_type, :original_filename
      end

      data.content_type = image[:filetype]
      data.original_filename = File.basename(image[:filename])

      data
    end
  end

  def authenticate_request!
    unless user_id_in_token?
      render json: { errors: ['Not Authenticated'] }, status: :unauthorized
      return
    end
    @current_user = User.find(auth_token[:user_id])
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end

  def http_token
      @http_token ||= if request.headers['Authorization'].present?
        request.headers['Authorization'].split(' ').last
      end
  end

  def auth_token
    @auth_token ||= JsonWebToken.decode(http_token)
  end

  def user_id_in_token?
    http_token && auth_token && auth_token[:user_id].to_i
  end

  def user_not_authorized
      render status: 403
  end

  def server_day
    t = Time.now
    t.strftime("%Y-%m-%d")
  end

  def server_time
    t = Time.now
    t.strftime("%H:%M:%S")
  end
end

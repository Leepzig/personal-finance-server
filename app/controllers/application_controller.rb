class ApplicationController < ActionController::API
    before_action :authorized
    #this may or may not work
    @jwt_pass_key = ENV["JWT_secret"]
    # @jwt_pass_key = "JWT_secret"
    
  def encode_token(payload)
    JWT.encode(payload, ENV["JWT_secret"])
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      # headers: { 'Authorization': 'Bearer <token>' }
      begin
        # binding.pry
        JWT.decode(token, ENV["JWT_secret"], true, algorithm: 'HS256')
        # JWT.decode => [{ "user_id"=>2 }, { "alg"=>"HS256" }]
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_user
    if decoded_token
      # decoded_token=> [{"user_id"=>2}, {"alg"=>"HS256"}]
      # or nil if we can't decode the token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end
end

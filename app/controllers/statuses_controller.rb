class StatusesController < ApplicationController
  before_action :authenticate, only: [:create]
  skip_before_filter :verify_authenticity_token, only: [:create]

  # GET /statuses
  # GET /statuses.json
  def index
    @status = Status.last || Status.new(available: "unavailable", created_at: DateTime.now)
  end

  # POST /statuses
  # POST /statuses.json
  def create
    @status = Status.new(status_params)

    if @status.save
      render json: @status
    else
      render json: @status.errors, status: :unprocessable_entity
    end
  end
  
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def status_params
      params.require(:status).permit(:available)
    end
    
    def authenticate
      key = params[:key]
      if key != "<my_secret>"
        render_unauthorized
      end
    end
    
end

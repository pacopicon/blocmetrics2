class API::EventsController < ApplicationController

  before_filter :set_access_control_headers

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Content-Type'
  end

  skip_before_action :verify_authenticity_token   # THIS IS ONLY IN DEVELOPMENT!  skipping authenticity token verification in production renders this API vulnerable to potential CSRF attacks.

  def create
    # Rails.logger.info "REQUEST: #{request.inspect}"
    @regapp = Regapp.find_by(url: request.env['HTTP_ORIGIN'])

    if @regapp.nil?
      render json: "Unregistered application, (pickaboo :-P)", status: :unprocessable_entity
    else
      @event = @regapp.events.build(event_params)

      if @event.save
        render json: @event, status: :created
      else
        render @event.errors, status: :unprocessable_entity
      end
    end
  end

  def index
    render nothing: true
  end

  private
  def event_params
    params.permit(:name, :instance)
  end

end

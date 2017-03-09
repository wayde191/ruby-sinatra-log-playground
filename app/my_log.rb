class MyLoggerMiddleware

  def initialize(app, logger)
    @app, @logger = app, logger
  end

  def call(env)
    env['my_logger'] = @logger

    rack_request_new = Rack::Request.new(env)
    request_message = format_request_details(rack_request_new)
    @logger.info(request_message)

    status, headers, response = @app.call(env)

    response_message = format_response_details(response, status, headers)
    @logger.info(response_message)

    [status, headers, response]
  end

  def format_request_details(request)
    body = request.body.read
    request.body.rewind
    "[#{Thread.current[:transaction_id]}] [#{request.request_method}] [#{request.path_info}] params: [#{request.params.to_s}] body: [#{body}]"
  end

  def format_response_details(response, status, headers)
    body = response
    "[#{Thread.current[:transaction_id]}] [#{status.to_s}] body: #{body} headers: [#{headers.to_s}]"
  end

end
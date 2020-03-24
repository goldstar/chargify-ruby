module Chargify
  # Response is essentially a decorator for a Faraday response. It delegates
  # body and status, but it also has knowledge on what constitutes a successful
  # request and what to do with the errors passed back from the Chargify API.
  class Response
    extend Forwardable

    attr_reader :raw_response, :request

    delegate [:body, :status] => :raw_response

    def initialize(raw_response)
      @raw_response = raw_response
    end

    def success?
      (200..299).include?(status)
    end

    def on_error
      yield self unless success?
      self
    end

    def raise_errors
      # case status
      # when 400
      #   fail Errors::BadRequest, body
      # when 401
      # when 403
      #   fail Errors::NotAuthorized, body
      # when 404
      #   fail Errors::NotFound, body
      # when 405
      #   fail Errors::MethodNotAllowed, body
      # when 429
      #   fail Errors::HitRateLimit, body
      # when 500
      # when (400..499)
      #   fail ServiceError, body
      # when (500..599)
      #   fail ServerError, body
      # end
    end
  end
end

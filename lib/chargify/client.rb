require "faraday"
require "faraday_middleware"

module Chargify
  # The client holds a Faraday connection to the Chargify API.
  # The get/post methods receive a uri (e.g. orders/create) and params, and wraps
  # the Faraday response with an Chargify::Response object.
  class Client
    extend Forwardable

    attr_reader :site

    delegate config: :site

    def initialize(site)
      @site = site
    end

    def connection
      @connection ||= Faraday.new(url: endpoint, proxy: config.proxy) do |conn|
        conn.use Faraday::Request::BasicAuthentication, config.api_key, "X"
        conn.use FaradayMiddleware::FollowRedirects
        conn.request :json
        conn.response :json
        conn.adapter Faraday.default_adapter
      end
    end

    def call(method, path, params={}, &block)
      raw_response = connection.public_send(method, path, params, &block)
      Response.new(raw_response).on_error(&:raise_errors)
    end

    [:get, :post, :put, :delete].each do |method|
      define_method(method) do |path, params={}, &block|
        call(method, path, params, &block)
      end
    end

    protected

    def endpoint
      "https://%{subdomain}.chargify.com/" % config
    end
  end
end

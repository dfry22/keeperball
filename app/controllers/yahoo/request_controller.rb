module Yahoo
  class RequestController < ApplicationController
    before_filter :require_login
    before_filter :refresh_token
    before_filter :access_token

    def transactions
      adapter = Keeperball::YahooApi::Adapter::League.new(access_token)
      @response = adapter.do_request
    end

    private

    def access_token
      auth = Keeperball::YahooApi::Authorization.new({}, current_user)
      OAuth::AccessToken.new(
        auth.consumer,
        current_user.yahoo_access_token,
        current_user.yahoo_access_token_secret
      )
    end

    def refresh_token
      redirect_to oauth_authorize_path if current_user.has_expired_access_token?
    end
  end
end

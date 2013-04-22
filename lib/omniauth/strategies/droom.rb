require 'omniauth-oauth2'
require 'multi_json'

module OmniAuth
  module Strategies
    class Droom < OmniAuth::Strategies::OAuth2

      option :name, :droom
      option :provider_ignores_state, true
      option :fields, [:name, :forename, :email, :phone, :admin, :image]
      option :client_options, {
        :site => ENV['droom_host'],
        :authorize_url => "/oauth/authorize"
      }

      uid do
        raw_info["id"]
      end

      info do
        {
          :email => raw_info["email"],
          :name => raw_info["name"],
          :admin => raw_info["admin"],
          :forename => raw_info["forename"],
          :image => raw_info["image"]
        }
      end

      extra do
        {
          :raw_info => raw_info
          # here we will eventually receive activity permissions
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/me.json').parsed
      end

    end
  end
end

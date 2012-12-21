# -*- encoding: utf-8 -*-
require "httparty"

module DBpedia
  module Spotlight
    class Client
      DEFAULT_ENDPOINT_URI = "http://spotlight.dbpedia.org/rest/"

      include HTTParty
      headers "Accept" => "application/json"
      format :json

      def initialize(endpoint = nil)
        @endpoint = endpoint || DEFAULT_ENDPOINT_URI
      end

      def annotate(text, options = {}) 
        options.merge!({
          :text => text,
          :confidence => 0,
          :support => 0
        })
        self.class.get(@endpoint + "annotate", { :query => options })
      end
    end
  end
end

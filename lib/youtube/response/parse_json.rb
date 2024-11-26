require 'faraday'
require 'multi_json'
require 'multi_xml'

module Youtube
  module Response
    class Parse < Faraday::Response::Json

      def parse(body)
        case body
        when /\A^\s*$\z/, nil
          nil
        when true
          MultiXml.parser = :nokogiri
          MultiXml.parse(body)
        else
          MultiJson.decode(body)
        end
      end

      def on_complete(env)
        puts env
        if respond_to?(:parse)
          env[:body] = parse(env[:body]) unless [204, 301, 302, 304].include?(env[:status])
        end
      end

    end
  end
end

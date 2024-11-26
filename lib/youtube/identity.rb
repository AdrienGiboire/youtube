require 'youtube/base'

module Youtube
  class Identity < Youtube::Base
    # Initializes a new object
    #
    # @param attrs [Hash]
    # @raise [ArgumentError] Error raised when supplied argument is missing an :id key.
    # @return [Youtube::Identity]

    def raw
      @attrs
    end

  private
    def statistics_count attribute
      if @attrs['statistics'].nil?
        0
      else
        @attrs['statistics'][attribute.to_s].to_i
      end
    end

    def statistics_value attribute
      if @attrs['statistics'].nil?
        nil
      else
        @attrs['statistics'][attribute.to_s]
      end
    end

    def status_value attribute
      if @attrs['status'].nil?
        nil
      else
        @attrs['status'][attribute.to_s]
      end
    end

  end
end

require_relative 'entity'

module GCAPI
  class Calendar < Entity
    attr_reader :id, :summary, :description, :location
    def initialize(auth, id = nil)
      @auth = auth
      @data = @auth.request(:get, "calendars/#{id}") || {}

      @calendar_id = @data.fetch(:id, nil)
      @summary = @data.fetch(:summary, nil)
      @location = @data.fetch(:location, nil)
      @events = {}
    end
    def to_s
      "Calendar id: #{@calendar_id} | Events: #{events.length rescue 0}"
    end

    def inspect
      to_s
    end

    def events
      if @events.empty?
        data = @auth.request(:get, "calendars/#{@calendar_id}/events")[:items]
        data.each do |event|
          @events[event[:id]] = Event.new(@auth, event)
        end
      end
      @events
    end

    def event(event_id)
      if @events[event_id.to_s].present?
        @events.fetch(event_id.to_s)
      else
        data = @auth.request(:get, "calendars/#{@calendar_id}/events/#{event_id}")
        event = Event.new(@auth, data)
        @events[data[:id]] = event
        event
      end
    end

    def << (event)
      if event.is_a?(Event)
        @auth.request(:post, "calendars/#{@calendar_id}/events", event.to_json)
      end
    end

    def clear
      response = @auth.request(:post, "calendars/#{@calendar_id}/clear")
      response.empty? ? true : false
    end

    def delete
      response = @auth.request(:delete, "calendars/#{@calendar_id}")
      response.empty? ? true : false
    end

    def update

    end

    def patch

    end

    def insert

    end
  end
end
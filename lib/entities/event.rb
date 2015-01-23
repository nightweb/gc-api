require_relative 'entity'

module GCAPI
  class Event < Entity
    attr_writer :id, :status, :link, :created, :updated, :summary, :description, :location, :creator, :organizer,
                :start, :end, :recurrence, :hangout, :visibility, :endless
    def initialize(auth)
      @auth = auth

      @visibility = 'default'
      yield(self) if block_given?
      @created = Time.parse(@created) rescue nil
      @updated = Time.parse(@updated) rescue nil
      @recurrence = Recurrence.new(@recurrence)
      @creator = Person.new(@creator)
      @organizer = Person.new(@organizer)
      @start = EventTime.new(@start)
      @end = EventTime.new(@end)
    end

    def delete
      response = false
      response = @auth.request(:delete, "/calendars/#{@calendar}/events/#{@id}").empty? if @id
      !!response
    end

    def to_json
      current.inject({}) do |s, (k,v)|
        if !v.nil?
          s[k] = v.kind_of?(Entity) ? v.to_json : v
        end
        s
      end
    end

    private

    def current
      { start: @start,
        end: @end,
        description: @description,
        location: @location,
        status: @status,
        visibility: @visiblity,
        summary: @summary,
        endTimeUnspecified: @endless
      }
    end

    def import

    end

    def insert
    end

    def instances
    end

    def list
    end

    def move
    end

    def patch
    end

    def save
    end

    def watch
    end
  end
end
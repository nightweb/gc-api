require_relative 'entity'

module GCAPI
  class Event < Entity
    attr_reader :id, :status, :link, :created, :updated, :summary, :description, :location, :creator, :organizer,
                :start, :end, :recurrence
    def initialize(obj = {})
      @data = obj

      raise GoogleCalendarAttributeError('Event is empty!') if @data.nil? || @data.empty?

      @id = @data['id']
      @status = @data['status']
      @link =  @data['htmlLink']
      @created = Time.parse(@data['created'])
      @updated = Time.parse(@data['updated'])
      @summary = @data['summary']
      @description = @data['description']
      @location = @data['location']
      @creator = Person.new(@data['creator'])
      @organizer = Person.new(@data['organizer'])
      @start = EventTime.new(@data['start'])
      @end = EventTime.new(@data['end'])
      @recurrence = Recurrance.new(@data['recurrence'])
      @hangout = @data['hangoutLink']
    end

    def delete
    end

    def get
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

    def update
    end

    def watch
    end
  end
end
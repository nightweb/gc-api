require_relative 'entity'

module GCAPI
  class Calendar < Entity
    attr_reader :id, :summary, :description, :location
    def initialize(obj = {})
      @data = obj

      raise GoogleCalendarAttributeError('Calendar is empty!') if @data.nil? || @data.empty?

      @id = @data['id']
      @summary = @data['summary'].to_s
      @description = @data['description'].to_s
      @location = @data['location'].to_s

      raise GoogleCalendarAttributeError("Attributes are missing!: ") if @id.nil?
    end

    def clear

    end

    def delete

    end

    def update

    end

    def patch

    end

    def insert

    end

    def get

    end
  end
end
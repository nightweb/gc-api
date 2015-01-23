require_relative 'entity'

module GCAPI
  class CalendarList < Entity
    attr_reader :id, :summary, :description, :primary, :deleted, :notifications
    def initialize(auth)
      @auth = auth
      @data = @auth.request(:get, 'users/me/calendarList')[:items]

      raise GoogleCalendarAttributesError.new('CalendarList is empty!') if @data.nil? || @data.empty?
    end

    def to_s
      "Authentication bearer: #{@auth.client_id} | Active: #{@auth.active?}"
    end

    def inspect
      "Authentication bearer: #{@auth.client_id} | Active: #{@auth.active?}"
    end

    def calendars
      @data.map { |entry| Calendar.new(@auth, entry[:id]) }
    end
  end
end
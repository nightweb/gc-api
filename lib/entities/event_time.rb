require_relative 'entity'

module GCAPI
  class EventTime < Entity
    def initialize(attributes = {})
      attributes ||= {}
      @date = Date.parse(attributes.fetch(:date)) rescue Date.today
      @datetime = DateTime.parse(attributes.fetch(:dateTime)) rescue DateTime.now
      @timezone = attributes.fetch(:timeZone, 'Europe/Moscow')
    end

    def to_json
      result = {}
      result[:date] = @date.strftime("%Y-%m-%d")
      result[:dateTime] = @datetime.new_offset(0).strftime("%Y-%m-%dT%H:%M:%S") if @datetime
      result[:timeZone] = @timezone if @timezone
      result
    end
  end
end

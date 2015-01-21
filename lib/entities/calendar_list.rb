require_relative 'entity'

module GCAPI
  class CalendarList < Entity
    attr_reader :id, :summary, :description, :primary, :deleted, :notifications
    def initialize(obj = {})
      @data = obj

      raise GoogleCalendarAttributeError.new('CalendarList is empty!') if @data.nil? || @data.empty?

      @id = @data['id'].to_s
      @summary = @data['summary'].to_s
      @description = @data['description'].to_s

      @primary = !!@data['primary']
      @deleted = !!@data['deleted']

      raise GoogleCalendarAttributeError.new("Attributes are missing!: ") if @id.nil? || @summary.nil?

      @notificationSettings = @data['notificationSettings']
      @notifications = []
      if @notificationSettings.any? && @notificationSettings['notifications'].any?
        @notificationSettings['notificationSettings'].each do |notification|
          @notifications << Notification.new(notification)
        end
      end
    end

    def delete

    end

    def get

    end

    def insert

    end

    def list

    end

    def patch

    end

    def update

    end

    def watch

    end
  end
end
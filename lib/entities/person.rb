require_relative 'entity'

module GCAPI
  class Person < Entity
    attr_reader :id, :email, :name, :current_user
    def initialize(attributes = {})
      attributes ||= {}
      @id = attributes.fetch(:id, nil)
      @email = attributes.fetch(:email, nil)
      @name = attributes.fetch(:displayName, nil)
      @self = !!attributes.fetch(:self, nil)
      @optional = !!attributes.fetch(:optional, nil)
      @comment = attributes.fetch(:comment, nil)
    end

    def to_json
      { email: @email, displayName: @name, comment: @comment }
    end
  end
end
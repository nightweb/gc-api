require_relative 'entity'

module GCAPI
  class Person < Entity
    attr_reader :id, :email, :name, :current_user
    def initialize(obj = {})
      @data = obj

      @id = @data['id']
      @email = @data['email']
      @name = @data['displayName']
      @current_user = !!@data['self']
    end
  end
end